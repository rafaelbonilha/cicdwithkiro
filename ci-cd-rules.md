---
title: CI/CD Pipeline Rules
inclusion: always
---

# Regras do Kiro no Pipeline de CI/CD

Este documento é carregado automaticamente em toda execução do Kiro CLI
dentro do GitHub Actions (jobs `kiro-review` e `kiro-auto-fix`). Ele define
limites de atuação — não é uma sugestão, é um contrato.

## Escopo permitido

- **kiro-review**: ler o diff do PR, comentar achados. Nunca alterar código
  nesse job.
- **kiro-auto-fix**: alterar código **somente** para corrigir a causa raiz
  de uma falha de deploy. Mudanças de escopo maior (refatoração,
  otimização, nova feature) são proibidas nesse contexto.

## Regras invioláveis

1. **Nunca commitar diretamente na `main`.** Toda alteração gerada pelo
   Kiro vai para uma branch nova e abre PR — mesmo em correções triviais.
2. **Nunca aprovar ou mergear o próprio PR.** Revisão humana é obrigatória
   antes de qualquer merge, sem exceção.
3. **Nunca alterar arquivos em `.github/workflows/` ou `.kiro/`** durante o
   job de auto-fix. Mudanças de pipeline ou de steering exigem revisão
   manual dedicada, não correção automática.
4. **Nunca remover ou enfraquecer testes** para fazer um build passar. Se a
   causa raiz for um teste quebrado, reporte no PR em vez de deletar ou
   pular o teste.
5. **Nunca tocar em segredos, variáveis de ambiente sensíveis ou políticas
   IAM** como parte de uma correção automática. Se a causa raiz exigir
   mudança de permissão, abra o PR descrevendo o problema e pare — não
   amplie permissões sozinho.

## Formato esperado de comentários (job kiro-review)

Ao comentar em um PR, estruture assim:

```
## Revisão automática (Kiro)

**Bugs potenciais:** ...
**Segurança:** ...
**Convenções (.kiro/steering):** ...
**Sugestão geral:** Aprovar / Aprovar com ressalvas / Solicitar mudanças
```

Não use linguagem definitiva tipo "este código está errado" — prefira
"isto pode causar X, considere Y", já que a decisão final é sempre do
revisor humano.

## Formato esperado de PRs de correção (job kiro-auto-fix)

- Título: `fix: <descrição curta da causa raiz>`
- Corpo do PR deve conter obrigatoriamente:
  - **Causa raiz** identificada (com trecho de log relevante)
  - **Mudança aplicada** (resumo, não o diff inteiro)
  - **Risco residual** — qualquer coisa que o revisor deva checar antes do
    merge
- Se não for possível identificar a causa raiz com confiança, **não
  adivinhe uma correção**. Abra a PR vazia ou um issue descrevendo o que
  foi investigado e o que ficou inconclusivo.
