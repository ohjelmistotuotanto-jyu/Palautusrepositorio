# Täytä kommenttien alle tarvittavat

# Perustana virallinen Python-image
FROM python:3.10


# Työhakemisto kontissa
WORKDIR /app 

# Kopioidaan riippuvuustiedosto ja asennetaan riippuvuudet
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopioidaan sovelluskoodi
COPY . .

# Asetetaan ympäristömuuttuja 
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0


# Käynnistyskomento
CMD ["flask", "run"]