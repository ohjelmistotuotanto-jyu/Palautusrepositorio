# Täytä kommenttien alle tarvittavat
FROM python:3.13
# Perustana virallinen Python-image


# Työhakemisto kontissa
WORKDIR /app

# Kopioidaan riippuvuustiedosto ja asennetaan riippuvuudet
COPY  requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Asetetaan ympäristömuuttuja 
ENV APP_NAME="Oma kontti"

# Kopioidaan sovelluskoodi
COPY app.py .

# Käynnistyskomento
CMD ["python", "app.py"]