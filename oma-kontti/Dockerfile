# Pohjakuva
FROM python:3.12-slim

# Työhakemisto kontissa
WORKDIR /app

# Asennetaan riippuvuudet ensin (hyödyntää Dockerin välimuistia)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Kopioidaan sovelluksen koodi
COPY . .

# Kerrotaan, mitä porttia sovellus kuuntelee
EXPOSE 80

# Käynnistyskomento
CMD ["python", "app.py"]