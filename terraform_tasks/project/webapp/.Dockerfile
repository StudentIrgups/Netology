FROM python:3.12-slim AS builder
COPY ./webapp/requirements.txt ./
RUN pip install -r requirements.txt
      
FROM builder
COPY ./webapp .
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]
