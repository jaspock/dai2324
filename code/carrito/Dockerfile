FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y npm nodejs sqlite3 \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

COPY "package.json" .

RUN npm install

COPY . .

EXPOSE 5000

CMD ["node","app.js"]
