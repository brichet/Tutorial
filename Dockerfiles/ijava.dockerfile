FROM openjdk:11.0.3-jdk as openjdk

FROM jupyter/base-notebook:latest

ENV USER jovyan
ENV NB_UID 1000
ENV HOME /home/${USER}

COPY --from=openjdk /usr/local/openjdk-11 /usr/local/openjdk-11
ENV JAVA_HOME /usr/local/openjdk-11
ENV PATH $JAVA_HOME/bin:$PATH

USER root
RUN apt-get update && \
    apt-get install -y curl unzip && \
    rm -rf /var/lib/apt/lists/*

USER ${USER}
RUN curl -L https://github.com/SpencerPark/IJava/releases/download/v1.3.0/ijava-1.3.0.zip > ijava-kernel.zip

# Unpack and install the kernel
RUN unzip ijava-kernel.zip -d ijava-kernel \
    && cd ijava-kernel \
    && python3 install.py --sys-prefix

# Install JFX

COPY ./Dockerfiles/ijava_JFX.py ijava_JFX.py

USER root
RUN apt-get update && \
    apt-get install -y xvfb openjfx && \
    rm -rf /var/lib/apt/lists/*

USER ${USER}
RUN python ijava_JFX.py
