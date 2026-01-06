FROM ghcr.io/mamba-org/micromamba:2.4-ubuntu24.04
USER root
RUN groupmod -g 1001 $MAMBA_USER && usermod -g 1001 -u 1001 $MAMBA_USER
RUN apt update && apt install -y git && rm -rf /var/lib/apt/lists/*
USER $MAMBA_USER
COPY --chown=$MAMBA_USER:$MAMBA_USER setup_emsdk_env.sh /tmp/setup_emsdk_env.sh
RUN micromamba install -y -n base python=3.12 pybind11 cmake eigen pyodide-build gtest rsync make gcc gxx patch nodejs xz wget && \
    micromamba clean --all --yes
ARG MAMBA_DOCKERFILE_ACTIVATE=1
RUN cd /tmp && ./setup_emsdk_env.sh && rm -rf sysroot && \
    cd build_env && rm -rf boost-* gsl-2.8/ jsoncpp/ muparser/ musl/ poco/ zlib/ libhdf5/
