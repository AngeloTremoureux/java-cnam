#!/bin/bash

project_name=$(grep -oP '<artifactId>\K[^<]+' pom.xml | head -n 1)

echo "["$(date "+%Y-%m-%d %H:%M:%S")"] - Démarrage de l'application Java \"${project_name}\"..."

echo "["$(date "+%Y-%m-%d %H:%M:%S")"] - Compilation de l'application Java..."

mvn clean install -q

echo "["$(date "+%Y-%m-%d %H:%M:%S")"] - Compilation terminée."

chmod 777 -R ./target/

jar_file=$(find target/ -name "$project_name-*.jar" | sort -V | tail -n 1)

if [ -n "$jar_file" ]; then
    echo "["$(date "+%Y-%m-%d %H:%M:%S")"] - Démarrage de l'application Java depuis le fichier JAR : $jar_file"
    java -jar "$jar_file"
else
    echo "["$(date "+%Y-%m-%d %H:%M:%S")"] - Aucun fichier JAR trouvé dans le répertoire courant."
    exit 1
fi