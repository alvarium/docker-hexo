FROM nginx:latest

LABEL maintainer="Òscar Casajuana <oscar@alvarium.io>" version="0.2.0"

RUN apt update && apt upgrade -y && apt install -y curl

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt install -y nodejs && \
    npm install -g hexo-cli
    # ln -s /usr/share/nginx/html /app

ADD default.conf /etc/nginx/conf.d/default.conf

WORKDIR /app

ADD entrypoint.sh /

VOLUME [ "/app" ]

ENTRYPOINT ["/entrypoint.sh"]