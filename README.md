# CI/CD Pipeline com Kiro + AWS

## Estrutura do Projeto

Este repositório contém um pipeline de CI/CD completo usando GitHub Actions, AWS e Kiro CLI.

## Arquivos

- `.github/workflows/ci-cd-kiro.yml` - Pipeline principal
- `.kiro/` - Regras e contexto para o Kiro
- `aws/` - Configurações de IAM e OIDC

## Como usar

1. Configure OIDC seguindo `aws/SETUP-OIDC.md`
2. Ajuste os ARNs em `aws/deploy-permissions-policy.json`
3. Atualize o nome do projeto em `./kiro/context.json`
4. Commit e push para ativar o pipeline

## Requisitos

- Node.js 20+
- AWS CDK
- GitHub Actions
- Kiro CLI
EOF

echo "✅ Estrutura criada com sucesso!"
echo "⚠️ Lembre-se de preencher os arquivos com os conteúdos que gerei."
