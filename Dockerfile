FROM python:3.10-slim-buster
WORKDIR /app
ADD . /app
RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8080
# CMD ["python", "main.py"]

CMD ["sh", "-c", "gunicorn main:app -k uvicorn.workers.UvicornWorker --workers ${WORKERS:-4} --threads ${THREADS:-2} --timeout ${TIMEOUT:-600} --bind 0.0.0.0:${PORT:-8080}"]