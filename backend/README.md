# 🚀 Backend - Game Server

Backend do jogo desenvolvido com **NestJS** e **Prisma ORM**.

## 📋 Pré-requisitos

- Node.js 18+
- npm ou yarn
- PostgreSQL (local ou via Docker)

## 🛠️ Instalação

```bash
npm install
```

## 🔧 Configuração

Crie um arquivo `.env` baseado em `.env.example`:

```bash
cp .env.example .env
```

Configure as variáveis:
- `DATABASE_URL` - URL de conexão com PostgreSQL
- `JWT_SECRET` - Secret para JWT
- `PORT` - Porta do servidor (padrão: 3000)

## 📦 Prisma Setup

Gere o cliente Prisma:

```bash
npm run prisma:generate
```

Crie a primeira migração:

```bash
npm run prisma:migrate
```

Acesse o Prisma Studio:

```bash
npm run prisma:studio
```

## 🚀 Executar

**Desenvolvimento:**
```bash
npm run dev
```

**Build:**
```bash
npm run build
```

**Produção:**
```bash
npm start
```

## 🧪 Testes

```bash
npm test
npm test:watch
npm test:cov
```

## 📊 Linting

```bash
npm run lint
```

## 📁 Estrutura

```
src/
├── common/          # Decoradores, guards, pipes, etc
├── modules/         # Feature modules (auth, users, game, etc)
└── main.ts         # Entrada da aplicação
prisma/
├── schema.prisma   # Schema do banco
└── migrations/     # Migrações
test/               # Testes
dist/               # Build compilado
```

## 🔌 API Endpoints

Documentação será adicionada conforme o desenvolvimento avança.

## 📚 Documentação

- [NestJS Documentation](https://docs.nestjs.com)
- [Prisma Documentation](https://www.prisma.io/docs)
