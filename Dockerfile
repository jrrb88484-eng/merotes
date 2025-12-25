FROM alpine:latest
RUN apk add --no-cache --virtual .build-deps ca-certificates curl
RUN curl -L -H "Cache-Control: no-cache" -o /v2ray.zip https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
RUN mkdir /v2raybin && unzip /v2ray.zip -d /v2raybin && rm /v2ray.zip
COPY config.json /v2raybin/config.json
ENTRYPOINT ["/v2raybin/v2ray", "-config", "/v2raybin/config.json"]
