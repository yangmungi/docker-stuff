FROM node:23

RUN apt-get update
RUN apt-get install -y ripgrep

RUN npm -d install -g npm
RUN npm -d install -g @openai/codex


RUN mkdir -p /w
WORKDIR /w

CMD ["/bin/bash"]
