FROM jupyter/base-notebook:latest

ENV CONDA_DIR=/opt/conda \
    SHELL=/bin/bash \
    NB_USER="jovyan" \
    NB_UID=1000 \
    NB_GID=100 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8
ENV PATH="${CONDA_DIR}/bin:${PATH}" \
    HOME="/home/${NB_USER}"

RUN conda install -y -c conda-forge mamba
RUN mamba install -y xeus-cling -c conda-forge

COPY ./energybalance_pkg/src/cpp /opt/conda/include/energybalance

USER ${USER}
WORKDIR ${HOME}