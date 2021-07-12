FROM python:3.9-alpine

RUN apk add --no-cache build-base musl-dev gcc

WORKDIR /fastapi_framework

COPY coverage.sh .

COPY requirements.txt .

RUN pip install -r requirements.txt && pip install aiosqlite coverage httpx

COPY fastapi_framework/ ./fastapi_framework

COPY tests/ ./tests

CMD chmod +x coverage.sh && ./coverage.sh