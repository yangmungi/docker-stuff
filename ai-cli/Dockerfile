FROM debian:trixie

RUN apt-get update
RUN apt-get install -y \
 build-essential \
 ca-certificates \
 gpg \
 lsb-release\
 wget

COPY hashicorp.sh /opt/hashicorp.sh
RUN bash /opt/hashicorp.sh

RUN apt-get update
RUN apt-get install -y \
 curl \
 file \
 git \
 jq \
 mupdf-tools \
 poppler-utils \
 python3 \
 python3-venv \
 qpdf \
 ripgrep \
 terraform \
 tesseract-ocr \
 vim

COPY setup.sh /opt/setup.sh

CMD ["/bin/bash"]
