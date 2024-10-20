#!/bin/bash

# Variables
VERSION="v0.10.0"
BIN_URL="https://github.com/piplabs/story/releases/download/$VERSION/story-node-linux-amd64.tar.gz"
NODE_DIR="$HOME/story-node"

# Crear directorio de instalación
mkdir -p $NODE_DIR && cd $NODE_DIR

# Descargar binarios
echo "Descargando binarios de Story Node versión $VERSION..."
curl -L $BIN_URL -o story-node.tar.gz

# Verificar si la descarga fue exitosa
if [ $? -ne 0 ]; then
    echo "Error al descargar los binarios. Verifica la URL y la conexión a Internet." >&2
    exit 1
fi

# Extraer binarios
echo "Extrayendo los binarios..."
tar -xvf story-node.tar.gz

# Mover binarios y configurar permisos
echo "Instalando binarios..."
sudo mv story /usr/local/bin/
sudo chmod +x /usr/local/bin/story

# Crear servicio systemd
echo "Configurando el servicio systemd..."
sudo tee /etc/systemd/system/story.service > /dev/null <<EOF
[Unit]
Description=Story Node
After=network.target

[Service]
User=$USER
ExecStart=/usr/local/bin/story
Restart=always
RestartSec=5
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

# Recargar systemd y habilitar servicio
echo "Habilitando y iniciando el servicio..."
sudo systemctl daemon-reload
sudo systemctl enable story.service
sudo systemctl start story.service

# Verificar si el servicio se inició correctamente
if systemctl is-active --quiet story.service; then
    echo "El nodo Story se ha instalado y se está ejecutando como un servicio."
else
    echo "Hubo un problema al iniciar el servicio. Verifica los registros para más detalles." >&2
    exit 1
fi
