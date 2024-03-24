# Kullanacağımız temel imaj
FROM python:3.9-alpine

# Çalışma dizini /app olarak ayarlanıyor
WORKDIR /app

RUN pip install --no-cache-dir virtualenv

RUN python -m virtualenv venv
ENV PATH="/app/venv/bin:$PATH"

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 7000

CMD ["python", "app.py"]