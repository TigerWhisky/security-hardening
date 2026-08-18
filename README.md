# Security Hardening

Projeto prático de **Security Hardening** e auditoria de segurança de aplicações e sistemas Linux.

Este repositório demonstra a aplicação prática de políticas de cibersegurança, com foco em:

- Endurecimento (hardening) de sistemas Linux
- Configuração segura de firewall (UFW) e SSH
- Identificação e mitigação de vulnerabilidades do **OWASP Top 10**
- Exemplos reais de código vulnerável vs código seguro

Desenvolvido para consolidar competências práticas de cibersegurança e complementar certificações Cisco e experiência profissional em ambientes de infraestrutura crítica.

---

## Objetivos

- Automatizar o processo de hardening de um servidor Linux
- Aplicar o princípio do menor privilégio e defesa em profundidade
- Analisar e corrigir vulnerabilidades comuns em aplicações web
- Produzir documentação técnica clara e acionável

---

## Estrutura do Repositório

| Pasta / Ficheiro              | Descrição                                      |
|-------------------------------|------------------------------------------------|
| `scripts/`                    | Scripts de hardening e auditoria               |
| `configs/`                    | Ficheiros de configuração endurecidos          |
| `examples/vulnerable/`        | Exemplo de aplicação com vulnerabilidades      |
| `examples/secured/`           | Versão corrigida e segura da aplicação         |
| `docs/`                       | Documentação técnica                           |
| `reports/`                    | Relatório detalhado de análise OWASP Top 10    |

---

## Scripts Disponíveis

| Script                  | Função                                      |
|-------------------------|---------------------------------------------|
| `harden_ufw.sh`         | Configuração segura do firewall UFW         |
| `harden_ssh.sh`         | Endurecimento do serviço SSH                |
| `harden_sysctl.sh`      | Parâmetros seguros de kernel (sysctl)       |
| `audit_system.sh`       | Auditoria básica de segurança do sistema    |
| `check_open_ports.sh`   | Verificação de portas abertas               |

---

## Como utilizar

```bash
# Clonar o repositório
git clone https://github.com/TEU_USER/security-hardening.git
cd security-hardening

# Dar permissões de execução
chmod +x scripts/*.sh

# Executar hardening do firewall (exemplo)
sudo ./scripts/harden_ufw.sh

# Executar auditoria
sudo ./scripts/audit_system.sh

Nota: Os scripts devem ser executados com privilégios de root e testados preferencialmente em ambiente de laboratório ou máquina virtual.

Relatório OWASP Top 10
O ficheiro principal de análise encontra-se em:
reports/relatorio-auditoria-owasp.md
Contém:

Explicação de cada vulnerabilidade do OWASP Top 10
Exemplos de código vulnerável
Versões corrigidas
Medidas de mitigação práticas

