#!/bin/bash
# ============================================================
# Auditoria básica de segurança
# ============================================================

echo "=============================================="
echo "       AUDITORIA DE SEGURANÇA DO SISTEMA"
echo "=============================================="
echo "Data: $(date)"
echo

echo ">>> Utilizadores com shell de login:"
grep -E '/bin/(bash|sh)$' /etc/passwd || true

echo
echo ">>> Portas em modo LISTEN:"
ss -tuln | grep LISTEN || true

echo
echo ">>> Últimos logins:"
last -n 8 || true

echo
echo ">>> Tentativas de login falhadas (últimas 10):"
grep "Failed password" /var/log/auth.log 2>/dev/null | tail -n 10 || echo "Log não disponível ou sem registos"

echo
echo ">>> Processos a correr como root (top 10):"
ps aux | awk '$1 == "root"' | head -n 10 || true

echo
echo "=============================================="
echo "             FIM DA AUDITORIA"
echo "=============================================="
