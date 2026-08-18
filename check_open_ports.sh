#!/bin/bash
# ============================================================
# Verificação de portas abertas
# ============================================================

echo "[+] Portas em estado LISTEN:"
echo
ss -tuln | grep LISTEN

echo
echo "[+] Processos associados:"
ss -tulnp 2>/dev/null | grep LISTEN || ss -tuln | grep LISTEN
