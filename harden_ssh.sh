#!/bin/bash
# ============================================================
# Script de Hardening do SSH
# ============================================================

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
   echo "[-] Este script deve ser executado como root"
   exit 1
fi

SSHD_CONFIG="/etc/ssh/sshd_config"
BACKUP="${SSHD_CONFIG}.bak.$(date +%F_%H-%M-%S)"

echo "[+] A criar backup → $BACKUP"
cp "$SSHD_CONFIG" "$BACKUP"

set_config() {
    local key="$1"
    local value="$2"
    if grep -q "^#*${key}" "$SSHD_CONFIG"; then
        sed -i "s/^#*${key}.*/${key} ${value}/" "$SSHD_CONFIG"
    else
        echo "${key} ${value}" >> "$SSHD_CONFIG"
    fi
}

echo "[+] A aplicar configurações de hardening..."

set_config "PermitRootLogin" "no"
set_config "PasswordAuthentication" "no"
set_config "PubkeyAuthentication" "yes"
set_config "PermitEmptyPasswords" "no"
set_config "X11Forwarding" "no"
set_config "MaxAuthTries" "3"
set_config "ClientAliveInterval" "300"
set_config "ClientAliveCountMax" "2"
set_config "LogLevel" "VERBOSE"
set_config "AllowAgentForwarding" "no"
set_config "AllowTcpForwarding" "no"

echo "[+] A validar configuração..."
sshd -t

echo "[+] A reiniciar o serviço SSH..."
systemctl restart ssh

echo "[+] Hardening do SSH concluído."
echo "[!] IMPORTANTE: Garante que tens acesso por chave SSH antes de fechar a sessão."
