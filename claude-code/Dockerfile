FROM debian:trixie

RUN apt-get update
RUN apt-get install -y curl git ripgrep vim

COPY .bashrc /root/.bashrc

RUN curl -fsSL https://claude.ai/install.sh | bash
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

RUN mkdir -p /w
WORKDIR /w

CMD ["/bin/bash"]
