FROM node:boron

MAINTAINER Cirici New Media <hello@cirici.com>

WORKDIR /app

RUN yarn global add hexo-cli

EXPOSE 4000

ENTRYPOINT ["hexo", "server", "-i", "0.0.0.0"]
