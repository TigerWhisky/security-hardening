#!/bin/bash
# ============================================================
# Hardening de parâmetros do kernel (sysctl)
# ============================================================

set -euo pipefail

if [[ $EUID -ne 0 ]]; then
   echo "[-] Este script deve ser executado como root"
   exit 1
fi

SYSCTL_FILE="/etc/sysctl.d/99-security-hardening.conf"

echo "[+] A escrever configurações em $SYSCTL_FILE"

cat > "$SYSCTL_FILE" << 'EOF'
# Desativar IP Forwarding
net.ipv4.ip_forward = 0
net.ipv6.conf.all.forwarding = 0

# Proteção anti-spoofing
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1

# Ignorar ICMP redirects
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv6.conf.all.accept_redirects = 0
net.ipv6.conf.default.accept_redirects = 0

# Não enviar ICMP redirects
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0

# SYN Cookies (proteção contra SYN Flood)
net.ipv4.tcp_syncookies = 1

# Ignorar broadcasts ICMP
net.ipv4.icmp_echo_ignore_broadcasts = 1

# Log de pacotes inválidos
net.ipv4.conf.all.log_martians = 1

# Desativar source routing
net.ipv4.conf.all.accept_source_route = 0
net.ipv6.conf.all.accept_source_route = 0

# ASLR
kernel.randomize_va_space = 2
EOF

echo "[+] A aplicar configurações..."
sysctl --system

echo "[+] Hardening de sysctl concluído."
