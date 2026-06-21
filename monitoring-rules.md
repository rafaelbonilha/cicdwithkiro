---
title: Monitoring & Observability Rules
inclusion: always
---

# Regras de Monitoramento para o Pipeline

Este documento define os padrões de observabilidade que o Kiro deve verificar durante revisões de código.

---

## 1. Logging Estruturado

### Obrigatório para todas as Lambdas

**Formato JSON:**
```json
{
  "timestamp": "2024-01-15T10:30:00.123Z",
  "level": "INFO",
  "service": "payment-processor",
  "operation": "processPayment",
  "requestId": "abc-123-def",
  "userId": "user-456",
  "durationMs": 123.45,
  "status": "success",
  "message": "Payment processed successfully"
}