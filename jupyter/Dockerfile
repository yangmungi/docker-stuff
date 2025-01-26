ARG MAMBAFORGE_VERSION=24.3.0-0

FROM condaforge/mambaforge:${MAMBAFORGE_VERSION} AS base

RUN apt-get update --yes
RUN apt-get upgrade --yes

WORKDIR /tmp

COPY install-apt.sh ./
RUN /bin/bash install-apt.sh

RUN mamba install -y jupyterlab jupyter_http_over_ws conda-forge::jupyter-ai

COPY require-core-science.txt ./
RUN mamba install -y --file require-core-science.txt

COPY require-visualizers.txt ./
RUN mamba install -y --file require-visualizers.txt

COPY require-llms.txt ./
RUN mamba install -y --file require-llms.txt

FROM base AS basic

WORKDIR /notebook

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

FROM base AS multikernel

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

