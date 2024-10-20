#!/bin/bash

# Variables
VERSION="v0.10.0"
NODE_DIR="$HOME/story_node"
BIN_URL="https://github.com/piplabs/story/releases/download/${VERSION}/story-linux-amd64-${VERSION}-9603826.tar"

echo "Instalando nodo Story versión ${VERSION}..."

# Crear directorio de instalación
mkdir -p $NODE_DIR
cd $NODE_DIR

# Descargar binario
echo "Descargando binarios desde ${BIN_URL}..."
curl -LO $BIN_URL

# Extraer archivo
echo "Extrayendo binarios..."
tar -xvf story-linux-amd64-${VERSION}-9603826.tar

# Mover binarios a /usr/local/bin
echo "Instalando binarios..."
sudo mv story /usr/local/bin/
sudo chmod +x /usr/local/bin/story

# Crear servicio de systemd
echo "Configurando servicio systemd..."
sudo tee /etc/systemd/system/story.service > /dev/null <<EOL
[Unit]
Description=Story Node Service
After=network.target

[Service]
Type=simple
User=$USER
ExecStart=/usr/local/bin/story run
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOL

# Recargar systemd y habilitar el servicio
echo "Habilitando servicio story..."
sudo systemctl daemon-reload
sudo systemctl enable story.service
sudo systemctl start story.service

echo "Instalación y configuración completadas."
