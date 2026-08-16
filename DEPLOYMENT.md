# 🚀 Deployment no Render

Guia completo para fazer deploy do projeto no [Render](https://render.com).

## 📋 Pré-requisitos

1. Conta no Render
2. Repositório no GitHub (público ou privado)
3. Banco de dados Aiven PostgreSQL configurado
4. Variáveis de ambiente prontas

## 🔧 Configuração do Banco de Dados (Aiven)

### Criar banco no Aiven

1. Acesse [aiven.io](https://aiven.io)
2. Crie um novo PostgreSQL database
3. Copie a `DATABASE_URL` (será necessária)

### Formato da URL

```
postgresql://username:password@host.aivencloud.com:port/dbname?sslmode=require
```

## 🐳 Deploy com Docker no Render

### 1. Conectar repositório GitHub

1. Acesse [render.com](https://render.com) e faça login
2. Clique em "New" → "Web Service"
3. Selecione seu repositório GitHub
4. Conecte a conta GitHub se necessário

### 2. Configurar o serviço

**Nome**: `site-luiz-otavio` (ou seu preferido)

**Environment**: Docker

**Build Command**: 
```bash
npm install --workspaces && npm run build --workspace=backend
```

**Start Command**: 
```bash
npm start --workspace=backend
```

### 3. Variáveis de ambiente

Adicione as seguintes variáveis:

```
NODE_ENV=production
DATABASE_URL=postgresql://... (URL do Aiven)
JWT_SECRET=seu-jwt-secret-seguro
PORT=3000
CORS_ORIGIN=https://seu-dominio.com
```

### 4. Deploy

- Clique em "Create Web Service"
- Aguarde o build (pode levar alguns minutos)
- Seu servidor estará disponível em `https://seu-dominio.onrender.com`

## 🌐 Deploy do Frontend

Você tem duas opções:

### Opção A: Mesmo serviço (Recomendado)

O Dockerfile.frontend.prod já está configurado para servir o frontend no mesmo serviço.

### Opção B: Serviço separado (Render Static Site)

1. Crie um novo "Static Site" no Render
2. Conecte seu repositório
3. Build Command: `cd frontend && npm install && npm run build`
4. Publish directory: `frontend/dist`

## 🔄 Deploy automático

O Render fará deploy automático a cada push para a branch principal:

```bash
git push origin main
```

## 📊 Monitoramento

1. Acesse seu serviço no Render
2. Vá para "Logs" para ver logs em tempo real
3. Use "Metrics" para monitorar CPU, memória, etc

## 🔐 SSL/TLS

Render fornece SSL/TLS automático para seu domínio `.onrender.com`.

Para usar domínio customizado:

1. Vá para "Environment" → "Custom Domain"
2. Configure os registros DNS do seu domínio
3. Render gerará certificado SSL automático

## 🆘 Troubleshooting

### Build falha

- Verifique os logs em "Logs"
- Certifique-se que todos os arquivos `.env` estão corretos
- Confirme que `DATABASE_URL` é válida

### Aplicação não inicia

- Verifique se `PORT=3000` está configurado
- Veja se `DATABASE_URL` está acessível
- Confirme que as migrações Prisma foram executadas

### Executar migrações Prisma em produção

Adicione ao seu `package.json`:

```json
"scripts": {
  "prisma:migrate:prod": "prisma migrate deploy"
}
```

E configure no Render:

**Build Command**:
```bash
npm install && npm run prisma:migrate:prod && npm run build
```

## 💰 Custo

- **Render**: Plano gratuito inclui 750h/mês
- **Aiven**: Plano pagável (começando com trial gratuito)

## 📚 Referências

- [Render Docs](https://render.com/docs)
- [Render Docker Deploy](https://render.com/docs/docker)
- [Aiven PostgreSQL](https://aiven.io/postgresql)
- [Prisma Deploy](https://www.prisma.io/docs/guides/deployment/deployment-guides/deploying-to-vercel)

## 🎯 Próximos passos

1. Testar localmente com Docker
2. Configurar CI/CD
3. Adicionar testes automatizados
4. Configurar backups do banco de dados
5. Monitorar performance
