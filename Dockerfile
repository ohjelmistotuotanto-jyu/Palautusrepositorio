# Täytä kommenttien alle tarvittavat

# Perustana virallinen Python-image
# pkgutil.get_loader is deprecated and removed in 3.14:
# https://docs.python.org/3/whatsnew/3.14.html#pkgutil
FROM python:3.13-alpine

# Työhakemisto kontissa
WORKDIR /app

# Kopioidaan riippuvuustiedosto ja asennetaan riippuvuudet
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopioidaan sovelluskoodi
COPY app.py .

# Asetetaan ympäristömuuttuja
ENV APP_NAME="Oma kontti"

# Käynnistyskomento
EXPOSE 80/tcp
CMD ["python", "app.py"]
