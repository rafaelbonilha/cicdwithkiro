#!/bin/bash

# Criar diretórios
mkdir -p .github/workflows .kiro aws

# 1. Pipeline principal
cat > .github/workflows/ci-cd-kiro.yml << 'EOF'
# [COLE AQUI O CONTEÚDO DO ci-cd-kiro.yml QUE GEREI ACIMA]
EOF

# 2. Regras do Kiro - CI/CD
cat > .kiro/ci-cd-rules.md << 'EOF'
# [COLE AQUI O CONTEÚDO DO ci-cd-rules.md QUE GEREI ACIMA]
EOF

# 3. Regras de Segurança
cat > .kiro/security-rules.md << 'EOF'
# [COLE AQUI O CONTEÚDO DO security-rules.md ORIGINAL]
EOF

# 4. Convenções de Código
cat > .kiro/code-conventions.md << 'EOF'
# [COLE AQUI O CONTEÚDO DO code-conventions.md ORIGINAL]
EOF

# 5. Regras de Monitoramento
cat > .kiro/monitoring-rules.md << 'EOF'
# [COLE AQUI O CONTEÚDO DO monitoring-rules.md QUE GEREI]
EOF

# 6. Contexto do Kiro
cat > .kiro/context.json << 'EOF'
{
  "project": "meu-projeto",
  "autoFixHistory": [],
  "knownIssues": [],
  "learningPatterns": [],
  "lastDeploy": null,
  "metrics": {
    "totalFixes": 0,
    "successfulFixes": 0,
    "failedFixes": 0
  }
}
EOF

# 7. Setup OIDC
cat > aws/SETUP-OIDC.md << 'EOF'
# [COLE AQUI O CONTEÚDO DO SETUP-OIDC.md QUE GEREI]
EOF

# 8. Trust Policy
cat > aws/trust-policy-github-oidc.json << 'EOF'
# [COLE AQUI O CONTEÚDO DO trust-policy-github-oidc.json ORIGINAL]
EOF

# 9. Deploy Permissions
cat > aws/deploy-permissions-policy.json << 'EOF'
# [COLE AQUI O CONTEÚDO DO deploy-permissions-policy.json MELHORADO]
EOF

# 10. README
cat > README.md << 'EOF'
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