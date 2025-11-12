# Perustana virallinen Python-image
FROM python:3.10

# Tyohakemisto kontissa
WORKDIR /app


# Kopioidaan riippuvuustiedosto ja asennetaan riippuvuudet
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopioidaan sovelluskoodi
COPY app.py .

# Asetetaan ymparistomuuttuja 
EXPOSE 8080

ENV APP_NAME="appi"

# Kaynnistyskomento
CMD ["python", "app.py"]