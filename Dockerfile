# Täytä kommenttien alle tarvittavat

# Perustana virallinen Python-image
FROM python:3.10

# Työhakemisto kontissa
WORKDIR /app

# Kopioidaan riippuvuustiedosto ja asennetaan riippuvuudet
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopioidaan sovelluskoodi
COPY app.py .

# Asetetaan ympäristömuuttuja 
ENV APP_NAME="oma-kontti"

# Käynnistyskomento
CMD ["python", "app.py"]