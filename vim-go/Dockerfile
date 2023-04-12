ARG GO_VERSION="1.19"
ARG VIM_GO_VERSION="v1.28"

FROM golang:$GO_VERSION

RUN apt-get update
RUN apt-get install -y vim git

RUN git clone https://github.com/fatih/vim-go.git /root/.vim/pack/plugins/start/vim-go
WORKDIR /root/.vim/pack/plugins/start/vim-go
RUN git checkout $VIM_GO_VERSION

WORKDIR /go

RUN vim -N --not-a-term "+:GoInstallBinaries" "+:qa"

COPY vimrc /root/.vimrc

RUN apt-get install -y less

CMD ["/bin/bash"]
