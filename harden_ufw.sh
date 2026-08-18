#!/bin/bash
# ============================================================
# Script de Hardening do Firewall UFW
# ============================================================

set -euo pipefail

echo "[+] A iniciar hardening do UFW..."

if [[ $EUID -ne 0 ]]; then
   echo "[-] Este script deve ser executado como root"
   exit 1
fi

if ! command -v ufw &> /dev/null; then
    echo "[+] A instalar UFW..."
    apt-get update && apt-get install -y ufw
fi

echo "[+] A repor regras..."
ufw --force reset

echo "[+] A definir políticas por omissão..."
ufw default deny incoming
ufw default allow outgoing

echo "[+] A permitir SSH (porta 22)..."
ufw allow 22/tcp comment 'SSH'

# Descomenta conforme necessário:
# ufw allow 80/tcp comment 'HTTP'
# ufw allow 443/tcp comment 'HTTPS'

echo "[+] A ativar logging..."
ufw logging on

echo "[+] A ativar o firewall..."
ufw --force enable

echo "[+] Estado atual:"
ufw status verbose

echo "[+] Hardening do UFW concluído."
