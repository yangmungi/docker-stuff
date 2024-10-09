export DEBIAN_FRONTEND=noninteractive 
export TZ=Etc/UTC

apt-get install --yes --no-install-recommends \
    fonts-dejavu \
    gfortran \
    git \
    gcc \
    less \
    openssh-client \
    pandoc \
    texlive-xetex texlive-fonts-recommended texlive-plain-generic \
    tzdata \
    unzip \
    xclip
