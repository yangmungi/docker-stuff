FROM node:23

RUN npm -d install -g npm@11.6.0
RUN npm -d install -g @anthropic-ai/claude-code

RUN mkdir -p /w
WORKDIR /w

CMD ["/bin/bash"]
