# Relatório de Auditoria – OWASP Top 10 (2021)

**Projeto:** Security Hardening  
**Objetivo:** Identificar e mitigar vulnerabilidades comuns em aplicações web e sistemas

## A01:2021 – Broken Access Control

**Descrição:** Falhas que permitem a utilizadores aceder a recursos não autorizados.

**Mitigações:**
- Deny by default
- Verificação de permissões no servidor
- Princípio do menor privilégio

## A02:2021 – Cryptographic Failures

**Mitigações:**
- Nunca armazenar passwords em texto claro (usar bcrypt/Argon2)
- HTTPS obrigatório
- Segredos em variáveis de ambiente ou vaults

## A03:2021 – Injection

**Exemplo vulnerável:**

query = f"SELECT * FROM users WHERE username = '{username}'"

**Versão segura:**
cursor.execute("SELECT * FROM users WHERE username = ?", (username,))

## A04:2021 – Insecure Design
Mitigações: Threat modeling, secure design patterns, redução da superfície de ataque.

## A05:2021 – Security Misconfiguration
Exemplos: Debug ativo em produção, headers em falta, serviços desnecessários.
Mitigações aplicadas neste projeto: Hardening de SSH, UFW e sysctl.

## A06:2021 – Vulnerable and Outdated Components
Mitigações: Inventário de dependências + atualizações regulares + scanners (pip-audit, safety).

## A07:2021 – Identification and Authentication Failures
Mitigações: MFA, rate limiting, políticas de passwords fortes, gestão segura de sessões.

## A08:2021 – Software and Data Integrity Failures
Mitigações: Verificar integridade de pacotes, CI/CD seguro, evitar deserialização insegura.

## A09:2021 – Security Logging and Monitoring Failures
Mitigações: Logging de eventos de segurança + alertas + proteção dos logs.

## A10:2021 – Server-Side Request Forgery (SSRF)
Mitigações: Validação de URLs, whitelist de destinos, segmentação de rede.

Conclusão
A combinação de hardening de sistema operativo + correção de vulnerabilidades de aplicação reduz significativamente a superfície de ataque.
