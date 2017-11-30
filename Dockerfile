FROM nginx:latest

LABEL maintainer="Òscar Casajuana <oscar@alvarium.io>" version="0.2.0"

RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
    apt update && apt upgrade -y && apt install -y nodejs && \
    npm install -g hexo-cli
    # ln -s /usr/share/nginx/html /app

WORKDIR /usr/share/nginx/html

ADD entrypoint.sh /usr/share/nginx/html

VOLUME [ "/usr/share/nginx/html" ]

ENTRYPOINT ["entrypoint.sh"]
