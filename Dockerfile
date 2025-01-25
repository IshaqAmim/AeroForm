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

# Commande pour démarrer Rasa, utilise la variable d'environnement pour le port et le host dynamique
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005", "--host", "0.0.0.0"]
