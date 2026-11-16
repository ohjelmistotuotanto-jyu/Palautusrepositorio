# Täytä kommenttien alle tarvittavat

# Perustana virallinen Python-image
FROM python:3.10

# Työhakemisto kontissa
Workdir /app

# Kopioidaan riippuvuustiedosto ja asennetaan riippuvuudet
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopioidaan sovelluskoodi
copy . .

# Asetetaan ympäristömuuttuja 
ENV APP_NAME="Oma Kontti"

# Käynnistyskomento
CMD ["python", "app.py"]