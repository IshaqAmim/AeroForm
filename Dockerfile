# Utiliser une image de base avec Python 3.10
FROM python:3.10-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers nécessaires dans le conteneur
COPY requirements.txt .
COPY . .

# Mettre à jour pip et installer les dépendances
RUN pip install --upgrade pip

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port (le port sera récupéré par Render via la variable d'environnement PORT)
EXPOSE 5005

# Set default command
CMD ["bash", "-c", "rasa run --enable-api --cors '*' --port ${PORT:-5005}"]   
