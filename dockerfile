FROM python:3.8-alpine
COPY . /app
WORKDIR  /app
Run pip install -r requirements.txt
CMD pythin app.py
