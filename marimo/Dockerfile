FROM python:3.12

RUN pip install --upgrade pip

RUN mkdir -p /opt/marimo
COPY start.sh /opt/start.sh

WORKDIR /opt/marimo
RUN pip install marimo

COPY requirements.txt /opt/
RUN pip install -r /opt/requirements.txt

CMD ["/bin/bash", "/opt/start.sh"]
