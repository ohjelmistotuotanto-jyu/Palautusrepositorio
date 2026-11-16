# Täytä kommenttien alle tarvittavat
FROM python:3.11-slim

# Perustana virallinen Python-image
WORKDIR /app

# Työhakemisto kontissa
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopioidaan riippuvuustiedosto ja asennetaan riippuvuudet
COPY app.py .

# Kopioidaan sovelluskoodi
ENV APP_NAME="Oma kontti"

# Asetetaan ympäristömuuttuja 
EXPOSE 80

# Käynnistyskomento
CMD ["python", "app.py"]