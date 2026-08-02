FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y python3 curl && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m appuser
USER appuser

ENV APP_PORT=8000

WORKDIR /home/appuser
RUN echo "<h1>ubuntu base custom image</h1>" > index.html

HEALTHCHECK --interval=30s --timeout=3s \
    CMD curl -f http://localhost:${APP_PORT}/ || exit 1

CMD python3 -m http.server ${APP_PORT}