---
title: Security Review Standards
inclusion: always
---

# Padrões de Segurança para Revisão (Kiro)

Use esta lista como checklist mínimo ao revisar diffs de PR. Sinalize
qualquer item abaixo encontrado, mesmo que pareça intencional — deixe a
confirmação para o revisor humano.

## Sempre sinalizar

- Segredos, chaves de API, tokens ou credenciais hardcoded no código
  (mesmo em arquivos de teste ou exemplo)
- Policies IAM com `"Resource": "*"` ou `"Action": "*"` sem justificativa
  explícita em comentário
- Uso de `eval`, `exec`, ou deserialização de dados não confiáveis
- Dependências novas adicionadas sem estarem no lockfile correspondente
- Desabilitação de validação de certificado TLS/SSL
- Logs que podem conter PII (CPF, e-mail, dados de cartão) sem mascaramento
- Mudanças em arquivos de IaC (CDK/Terraform) que abrem portas/ranges de
  IP amplos (`0.0.0.0/0`) em security groups

## Nível de severidade no comentário

Classifique cada achado como:
- 🔴 **Bloqueante** — segredo exposto, IAM `*:*`, falha de auth
- 🟡 **Atenção** — boas práticas, pode ir para produção mas merece nota
- 🔵 **Sugestão** — estilo, não tem impacto de segurança

## O que NÃO fazer

- Não tente corrigir o problema de segurança automaticamente neste job
  (`kiro-review` é somente leitura/comentário).
- Não rejeite o PR sozinho — apenas classifique e descreva. A decisão de
  bloquear o merge é da branch protection + revisor humano.
