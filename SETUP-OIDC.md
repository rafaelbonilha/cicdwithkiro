# Setup do OIDC entre GitHub Actions e AWS

Este documento descreve os passos para configurar a autenticação OIDC entre GitHub Actions e AWS.

## Pré-requisitos

- AWS CLI instalado e configurado
- Permissões para criar roles e políticas IAM
- Account ID da AWS
- Nome do repositório GitHub (ex: `minha-org/meu-repo`)

---

## 1) Criar o provedor OIDC do GitHub (uma vez por conta AWS)

Pule este passo se a conta já tiver um provedor OIDC do GitHub configurado.

```bash
# Verificar se já existe
aws iam list-open-id-connect-providers

# Criar o provedor
aws iam create-open-id-connect-provider \
  --url https://token.actions.githubusercontent.com \
  --client-id-list sts.amazonaws.com \
  --thumbprint-list 6938fd4d98bab03faadb97b34396831e3780aea1