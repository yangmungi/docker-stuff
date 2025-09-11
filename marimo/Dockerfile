FROM python:3.12

RUN pip install uv

RUN mkdir -p /opt/marimo
COPY start.sh /opt/start.sh

WORKDIR /opt/marimo
RUN uv venv
RUN uv pip install marimo

COPY requirements.txt /opt/
RUN uv pip install -r /opt/requirements.txt

CMD ["/bin/bash", "/opt/start.sh"]
