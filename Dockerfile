FROM openjdk:11.0.3-jdk as openjdk

FROM jupyter/r-notebook:latest

ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    USER="jovyan" \
    UID=1000 \
    GID=100 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH="${CONDA_DIR}/bin:${PATH}" \
    HOME="/home/${USER}"

USER root
RUN apt-get update

USER ${USER}

# Python KERNEL INSTALLATION
RUN git clone https://github.com/AgriculturalModelExchangeInitiative/PyCrop2ML.git
WORKDIR PyCrop2ML
RUN pip install -r requirements.txt
RUN pip install .
WORKDIR ${HOME}
RUN rm -rf PyCrop2ML

# C++ KERNEL INSTALLATION
RUN conda install -y -c conda-forge mamba
RUN mamba install -y xeus-cling -c conda-forge

COPY ./energybalance_pkg/src/cpp /opt/conda/include/energybalance

# JAVA KERNEL INSTALLATION
COPY --from=openjdk /usr/local/openjdk-11 /usr/local/openjdk-11
ENV JAVA_HOME /usr/local/openjdk-11
ENV PATH $JAVA_HOME/bin:$PATH

USER root
RUN apt-get install -y curl unzip

USER ${USER}
RUN curl -L https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip > ijava-kernel.zip

# Unpack and install the kernel
RUN unzip ijava-kernel.zip -d ijava-kernel \
    && cd ijava-kernel \
    && python3 install.py --sys-prefix

# FORTRAN KERNEL INSTALLATION

USER root
RUN apt-get install -y git gfortran

#RUN chown ${USER}:users -R /tmp && chmod o+t -R /tmp

USER ${USER}
RUN pip install jupyter-fortran-kernel
RUN git clone https://github.com/ZedThree/jupyter-fortran-kernel.git jupyter-fortran-kernel
WORKDIR jupyter-fortran-kernel
RUN jupyter-kernelspec install --prefix=/opt/conda/ fortran_spec/

USER root
RUN chown -R ${USER} /home/${USER}

# DOTNET KERNEL INSTALLATION
WORKDIR ${HOME}

ENV \
    # Enable detection of running in a container
    DOTNET_RUNNING_IN_CONTAINER=true \
    # Enable correct mode for dotnet watch (only mode supported in a container)
    DOTNET_USE_POLLING_FILE_WATCHER=true \
    # Skip extraction of XML docs - generally not useful within an image/container - helps performance
    NUGET_XMLDOC_MODE=skip \
    # Opt out of telemetry until after we install jupyter when building the image, this prevents caching of machine id
    DOTNET_INTERACTIVE_CLI_TELEMETRY_OPTOUT=true

# Install .NET CLI dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        libc6 \
        libgcc1 \
        libgssapi-krb5-2 \
        libicu66 \
        libssl1.1 \
        libstdc++6 \
        zlib1g

# Install .NET Core SDK

# When updating the SDK version, the sha512 value a few lines down must also be updated.
ENV DOTNET_SDK_VERSION 5.0.102

RUN dotnet_sdk_version=5.0.102 \
    && curl -SL --output dotnet.tar.gz https://dotnetcli.azureedge.net/dotnet/Sdk/$dotnet_sdk_version/dotnet-sdk-$dotnet_sdk_version-linux-x64.tar.gz \
    && dotnet_sha512='0ce2d5365ca39808fb71baec4584d4ec786491c3735543dc93244604ea97e242377d0987cd8b1e529258dee68f203b5780559201e7ea6d84487d6d8d433329b3' \
    && echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -ozxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
    # Trigger first run experience by running arbitrary cmd
    && dotnet help

# Add package sources
RUN echo "\
<configuration>\
  <solution>\
    <add key=\"disableSourceControlIntegration\" value=\"true\" />\
  </solution>\
  <packageSources>\
    <clear />\
    <add key=\"dotnet-public\" value=\"https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-public/nuget/v3/index.json\" />\
    <add key=\"dotnet-eng\" value=\"https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-eng/nuget/v3/index.json\" />\
    <add key=\"dotnet-tools\" value=\"https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-tools/nuget/v3/index.json\" />\
    <add key=\"dotnet-libraries\" value=\"https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-libraries/nuget/v3/index.json\" />\
    <add key=\"dotnet5\" value=\"https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet5/nuget/v3/index.json\" />\
    <add key=\"MachineLearning\" value=\"https://pkgs.dev.azure.com/dnceng/public/_packaging/MachineLearning/nuget/v3/index.json\" />\
  </packageSources>\
  <disabledPackageSources />\
</configuration>\
" > ${HOME}/NuGet.config

RUN chown -R ${UID} ${HOME}

USER ${USER}

#Install nteract
RUN pip install nteract_on_jupyter

# Install lastest build from main branch of Microsoft.DotNet.Interactive
RUN dotnet tool install -g Microsoft.dotnet-interactive --add-source "https://pkgs.dev.azure.com/dnceng/public/_packaging/dotnet-tools/nuget/v3/index.json"

ENV PATH="${PATH}:${HOME}/.dotnet/tools"
RUN echo "$PATH"

# Install kernel specs
RUN dotnet interactive jupyter install

# Enable telemetry once we install jupyter for the image
ENV DOTNET_INTERACTIVE_CLI_TELEMETRY_OPTOUT=false

COPY ./energybalance_pkg/test ${HOME}/Notebooks/energyBalance

USER root
RUN rm -rf /var/lib/apt/lists/*

USER ${USER}

# Set root to Notebooks
WORKDIR ${HOME}/Notebooks/
