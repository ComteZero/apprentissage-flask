FROM python:3.7-buster

LABEL author="countzr@gmail.com"
LABEL version="0.0.1"

RUN apt-get update && apt-get install -y \
    nginx=1.14.2-2+deb10u1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY app.py /app
COPY requirements.txt /app
RUN pip install -r requirements.txt


RUN useradd -M -r -d /app flask-application
USER flask-application
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
