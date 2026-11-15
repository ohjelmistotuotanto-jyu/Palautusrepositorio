# Täytä kommenttien alle tarvittavat

# Perustana virallinen Python-image
FROM python:3.10

# Työhakemisto kontissa
WORKDIR /app

# Kopioidaan riippuvuustiedosto ja asennetaan riippuvuudet
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev --no-install-project
# Kopioidaan sovelluskoodi
COPY app.py .

# Asetetaan ympäristömuuttuja 
ENV APP_NAME="Oma kontti"

# Käynnistyskomento
CMD ["uv", "run", "--no-sync", "python", "app.py"]