#!/bin/bash
set -e

# Basic bootstrap for Ollama inference server
yum update -y
amazon-linux-extras enable docker
yum install -y docker curl
systemctl enable --now docker

curl -fsSL https://ollama.com/install.sh | sh

cat > /etc/systemd/system/ollama.service <<'EOF'
[Unit]
Description=Ollama inference service
After=network.target

[Service]
Type=simple
ExecStart=/usr/local/bin/ollama serve --port 11434 --listen 0.0.0.0
Restart=on-failure
User=root

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now ollama.service

if command -v ollama >/dev/null 2>&1; then
  /usr/local/bin/ollama pull ${ollama_model} || true
fi
