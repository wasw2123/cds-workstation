FROM python:3.13-slim

WORKDIR /app

# uv 설치
COPY --from=ghcr.io/astral-sh/uv:0.11 /uv /usr/local/bin/uv

# 의존성 레이어 캐시 (소스 변경 시 재설치 생략)
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev

# 소스 복사
COPY . .

RUN chmod +x entrypoint.sh


EXPOSE 8000

CMD ["./entrypoint.sh"]
