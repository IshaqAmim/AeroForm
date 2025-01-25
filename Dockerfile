# Utiliser une image de base avec Python 3.10
FROM python:3.0-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers nécessaires dans le conteneur
COPY requirements.txt .
COPY . .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Exposer le port utilisé par Rasa
EXPOSE 5005

# Commande pour démarrer Rasa
CMD ["rasa", "run", "--enable-api"]
