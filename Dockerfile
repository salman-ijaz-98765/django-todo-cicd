# FROM python:3

# RUN apt-get update && apt-get install -y python3-distutils

# WORKDIR /data

# RUN pip install django==3.2

# COPY . .

# RUN python manage.py migrate

# EXPOSE 8000

# CMD ["python","manage.py","runserver","0.0.0.0:8000"]

FROM python:3.7

RUN apt-get update && apt-get install -y \
    python3-distutils \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /data

RUN pip install --no-cache-dir django==3.2

COPY . .

RUN python -m ensurepip --upgrade && python manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



