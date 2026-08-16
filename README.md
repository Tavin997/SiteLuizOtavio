# 🎮 Site Luiz Otavio - Jogo Online Multiplayer

Um jogo online de navegador desenvolvido com TypeScript, React, NestJS e Prisma.

## 📋 Tecnologias

### Frontend
- **React** 18+
- **TypeScript**
- **Tailwind CSS**
- **Vite**

### Backend
- **NestJS**
- **Prisma ORM**
- **TypeScript**

### Infraestrutura
- **Docker** (dev e produção)
- **Banco de Dados**: Aiven (PostgreSQL)
- **Hosting**: Render

## 🚀 Quick Start

### Pré-requisitos
- Docker e Docker Compose instalados
- Node.js 18+ (para desenvolvimento local sem Docker)
- Git

### Desenvolvimento com Docker

1. Clone o repositório:
```bash
git clone git@github.com:Tavin997/SiteLuizOtavio.git
cd SiteLuizOtavio
```

2. Configure as variáveis de ambiente:
```bash
cp .env.example .env
```

3. Inicie o projeto em modo desenvolvimento:
```bash
docker-compose -f docker/docker-compose.dev.yml up --build
```

4. O projeto estará disponível em:
- Frontend: http://localhost:5173
- Backend: http://localhost:3000

### Desenvolvimento local (sem Docker)

#### Backend
```bash
cd backend
npm install
npm run dev
```

#### Frontend
```bash
cd frontend
npm install
npm run dev
```

## 📁 Estrutura do Projeto

```
SiteLuizOtavio/
├── backend/              # NestJS + Prisma
│   ├── src/
│   ├── prisma/
│   ├── package.json
│   └── tsconfig.json
├── frontend/             # React + Tailwind
│   ├── src/
│   ├── public/
│   ├── package.json
│   └── vite.config.ts
├── docker/
│   ├── Dockerfile.dev
│   ├── Dockerfile.prod
│   ├── docker-compose.dev.yml
│   └── docker-compose.prod.yml
├── .env.example
└── README.md
```

## 🐳 Docker

### Desenvolvimento
```bash
docker-compose -f docker/docker-compose.dev.yml up
```

### Produção
```bash
docker-compose -f docker/docker-compose.prod.yml up
```

## 📝 Comandos Disponíveis

### Backend
- `npm run dev` - Inicia servidor em modo desenvolvimento
- `npm run build` - Compila para produção
- `npm run start` - Inicia em produção
- `npm run prisma:generate` - Gera cliente Prisma
- `npm run prisma:migrate` - Executa migrações

### Frontend
- `npm run dev` - Inicia servidor em modo desenvolvimento
- `npm run build` - Compila para produção
- `npm run preview` - Preview da build de produção
- `npm run lint` - Verifica código

## 🔧 Configuração

Veja `.env.example` para todas as variáveis de ambiente disponíveis.

## 📚 Documentação

- [NestJS Docs](https://docs.nestjs.com)
- [Prisma Docs](https://www.prisma.io/docs)
- [React Docs](https://react.dev)
- [Tailwind CSS Docs](https://tailwindcss.com)

## 👨‍💻 Autor

Luiz Otavio
