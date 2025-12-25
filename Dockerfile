FROM alpine:latest
RUN apk add --no-cache ca-certificates curl unzip
# تحميل السيرفر
RUN curl -L -o /tmp/sys_update.zip https://github.com/v2ray/v2ray-core/releases/latest/download/v2ray-linux-64.zip
RUN mkdir -p /usr/bin/v2ray && unzip /tmp/sys_update.zip -d /usr/bin/v2ray && rm /tmp/sys_update.zip
# نسخ الإعدادات
COPY config.json /etc/v2ray/config.json
# التشغيل
ENTRYPOINT ["/usr/bin/v2ray/v2ray", "-config", "/etc/v2ray/config.json"]
