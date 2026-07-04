FROM ghcr.io/xtls/xray-core:latest

WORKDIR /app

COPY config.template.json /app/config.template.json
COPY start.sh /app/start.sh

RUN chmod +x /app/start.sh

# Render sets $PORT at runtime; this EXPOSE is just documentation
EXPOSE 10000

ENTRYPOINT ["/app/start.sh"]
