# Utiliser une image de base avec Python 3.10
FROM python:3.10-slim

# Définir le répertoire de travail dans le conteneur
WORKDIR /app

# Copier les fichiers nécessaires dans le conteneur
COPY requirements.txt .  # Copie uniquement requirements.txt pour éviter une reinstallation inutile des dépendances si seul le code change
COPY . .  # Copier le reste des fichiers du projet

# Mettre à jour pip et installer les dépendances
RUN pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt

# Exposer le port (le port sera récupéré par Render via la variable d'environnement PORT)
EXPOSE 5005

# Commande pour démarrer Rasa, utilise la variable d'environnement pour le port et le host dynamique
CMD ["rasa", "run", "--enable-api", "--cors", "*", "--port", "5005", "--host", "0.0.0.0"]
