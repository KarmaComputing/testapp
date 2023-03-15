# syntax = docker/dockerfile:experimental
FROM python
ENV PYTHONUNBUFFERED=1
COPY . .
ENTRYPOINT ["./entrypoint.sh"]
EXPOSE 8000
