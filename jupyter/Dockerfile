#ARG MINIFORGE_VERSION=24.9.2-0
ARG MINIFORGE_VERSION=24.11.3-2

FROM condaforge/miniforge3:${MINIFORGE_VERSION} AS base

RUN apt-get update --yes
RUN apt-get upgrade --yes

WORKDIR /tmp

COPY install-apt.sh ./
RUN /bin/bash install-apt.sh

FROM base AS jupyter-dirty

COPY require-jupyter.txt ./
COPY require-core-science.txt ./
COPY require-visualizers.txt ./

RUN /bin/bash -c "cat requires-*.txt >mamba-requirements.txt"
RUN mamba install -y --file mamba-requirements.txt

COPY require-llms.txt ./
RUN pip install -r require-llms.txt

COPY torch.py.sh ./
RUN /bin/bash torch.py.sh

WORKDIR /notebook

FROM jupyter-dirty AS jupyter

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

FROM jupyter AS multikernel

# reference https://github.com/jupyter/docker-stacks/blob/main/datascience-notebook/Dockerfile
# Other runtimes

ARG JULIA_VERSION="1.10.5"
ENV JULIA_DEPOT_PATH=/opt/julia \
    JULIA_PKGDIR=/opt/julia \
    JULIA_VERSION="${JULIA_VERSION}"

WORKDIR /srv/ipython

COPY download-julia.sh ./
RUN /bin/bash download-julia.sh

COPY install-julia.sh ./
RUN /bin/bash install-julia.sh

COPY install-r.sh ./
RUN /bin/bash install-r.sh 

COPY register-julia.sh ./
RUN /bin/bash register-julia.sh

WORKDIR /notebook

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

