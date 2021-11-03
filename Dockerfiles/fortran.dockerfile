FROM jupyter/base-notebook:latest

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

WORKDIR ${HOME}

USER root
RUN apt-get update
RUN apt-get install -y git gfortran

#RUN chown ${USER}:users -R /tmp && chmod o+t -R /tmp

#USER ${USER}
RUN pip install jupyter-fortran-kernel
RUN git clone https://github.com/ZedThree/jupyter-fortran-kernel.git jupyter-fortran-kernel
WORKDIR jupyter-fortran-kernel
RUN jupyter-kernelspec install --prefix=/opt/conda/ fortran_spec/

RUN chown -R ${NB_USER} /home/${NB_USER}

USER ${USER}
WORKDIR ${HOME}/Notebooks/
