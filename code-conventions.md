---
title: Project Code Conventions
inclusion: always
---

# Convenções do Projeto

Contexto que o Kiro deve usar para avaliar consistência durante revisões
e correções. Ajuste os valores abaixo para refletir o projeto real.

## Stack

- Linguagem principal: TypeScript (Node 20)
- IaC: AWS CDK (não usamos Terraform neste projeto)
- Testes: Jest, cobertura mínima exigida de 80%
- Lint: ESLint + Prettier (configuração em `.eslintrc`)

## Padrões de commit

- Conventional Commits (`feat:`, `fix:`, `chore:`, `docs:`, `refactor:`)
- Mensagens em português, corpo do commit pode detalhar o "porquê"

## Estrutura de diretórios relevante

```
src/
  lib/          # stacks do CDK
  handlers/     # lambdas
  shared/       # utilitários compartilhados
test/
infra/
  cdk.json
```

## O que evitar neste projeto especificamente

- Não usar `any` em TypeScript sem comentário `// justificativa:`
- Não criar novos buckets S3 sem `block_public_access` explícito
- Não adicionar dependências com licença GPL (time jurídico já vetou)

## Quando o Kiro estiver em dúvida

Se uma convenção não estiver documentada aqui, **não invente um padrão**.
Comente perguntando, em vez de aplicar uma escolha arbitrária — isso vale
tanto para o job de review quanto para o de auto-fix.
