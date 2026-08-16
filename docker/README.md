# 🐳 Docker Configuration

Este projeto usa Docker para separar ambientes de desenvolvimento e produção.

## Estrutura

```
docker/
├── Dockerfile.dev              # Build para desenvolvimento
├── Dockerfile.prod             # Build para produção (backend)
├── Dockerfile.frontend.prod    # Build para produção (frontend com Nginx)
├── nginx.conf                  # Configuração do Nginx para frontend
├── docker-compose.dev.yml      # Orquestração para desenvolvimento
└── docker-compose.prod.yml     # Orquestração para produção
```

## 🛠️ Desenvolvimento

### Iniciar

```bash
docker-compose -f docker/docker-compose.dev.yml up --build
```

ou usando make:

```bash
make dev
```

### Serviços

- **PostgreSQL**: http://localhost:5432
- **Backend (NestJS)**: http://localhost:3000
- **Frontend (Vite)**: http://localhost:5173

### Características

- ✅ Hot reload para frontend e backend
- ✅ Volumes para sincronizar código local
- ✅ Banco de dados automático
- ✅ Network interna para comunicação entre containers

## 🚀 Produção

### Iniciar

```bash
docker-compose -f docker/docker-compose.prod.yml up --build
```

ou usando make:

```bash
make prod-up
```

### Serviços

- **Backend (NestJS)**: http://localhost:3000
- **Frontend (Nginx)**: http://localhost:80

### Características

- ✅ Multi-stage build para otimizar tamanho
- ✅ Usuario não-root por segurança
- ✅ Nginx como reverse proxy e servidor de arquivos estáticos
- ✅ Healthchecks configurados

### Banco de Dados em Produção

Por padrão, a configuração de produção NÃO inclui um container PostgreSQL. Use o **Aiven** como banco de dados externo:

1. Configure a variável `DATABASE_URL` no `.env` com a URL do Aiven
2. Descomente o serviço `postgres` em `docker-compose.prod.yml` se quiser rodar localmente

## 📝 Variáveis de Ambiente

### Development (.env)

```env
DATABASE_URL="postgresql://user:password@postgres:5432/game_db"
NODE_ENV=development
PORT=3000
JWT_SECRET="seu-secret-jwt-aqui"
VITE_API_URL=http://localhost:3000/api
POSTGRES_USER=game_user
POSTGRES_PASSWORD=game_password
POSTGRES_DB=game_db
```

### Production (.env)

```env
DATABASE_URL="postgresql://user:password@host:port/database"
NODE_ENV=production
PORT=3000
JWT_SECRET="seu-secret-jwt-seguro"
VITE_API_URL=/api
```

## 🔍 Debugging

### Ver logs

```bash
docker-compose -f docker/docker-compose.dev.yml logs -f [service]
```

Exemplo:
```bash
docker-compose -f docker/docker-compose.dev.yml logs -f backend
```

### Executar comando em container

```bash
docker-compose -f docker/docker-compose.dev.yml exec backend npm run prisma:migrate
```

### Acessar terminal do container

```bash
docker-compose -f docker/docker-compose.dev.yml exec backend sh
```

## 🗑️ Limpeza

### Parar containers

```bash
docker-compose -f docker/docker-compose.dev.yml down
```

### Remover volumes (dados do BD)

```bash
docker-compose -f docker/docker-compose.dev.yml down -v
```

### Limpar tudo

```bash
make clean
```

## 📦 Deployment no Render

1. Conecte seu repositório GitHub
2. Crie um novo serviço "Docker" no Render
3. Configure as variáveis de ambiente
4. Deploy automático a cada push

## 🔐 Segurança

- Todos os containers rodam como usuário não-root em produção
- Senhas não estão no código (use `.env`)
- Nginx valida requisições (remove arquivos ocultos)
- Healthchecks para auto-recovery

## 📚 Referências

- [Docker Documentation](https://docs.docker.com)
- [Docker Compose Documentation](https://docs.docker.com/compose)
- [Render Deploy Documentation](https://render.com/docs)
