FROM python:3.11-slim
WORKDIR /app
RUN groupadd -r appgroup && useradd -r -g appgroup appuser
COPY requirements*.txt ./
RUN pip install --no-cache-dir -r requirements.txt
USER appuser
EXPOSE 8000
HEALTHCHECK --interval=30s --timeout=3s CMD wget -qO- http://localhost:8000/health || exit 1
CMD ["python", "app.py"]