# Perustana virallinen Python-image
FROM python:3.12-slim

# Työhakemisto kontissa
WORKDIR /app

# Kopioidaan riippuvuustiedosto ja asennetaan riippuvuudet
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopioidaan sovelluskoodi
COPY app.py .

# Asetetaan ympäristömuuttuja
ENV APP_NAME="Essin Docker kontti"

# Käynnistyskomento
CMD ["python", "app.py"]