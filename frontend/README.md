# 🎮 Frontend - Game Client

Interface web do jogo desenvolvida com **React**, **TypeScript**, **Tailwind CSS** e **Vite**.

## 📋 Pré-requisitos

- Node.js 18+
- npm ou yarn

## 🛠️ Instalação

```bash
npm install
```

## 🔧 Configuração

As variáveis de ambiente são definidas em `.env`:

```bash
VITE_API_URL=http://localhost:3000/api
```

## 🚀 Executar

**Desenvolvimento:**
```bash
npm run dev
```

Acesse em `http://localhost:5173`

**Build:**
```bash
npm run build
```

**Preview da build:**
```bash
npm run preview
```

## 🧪 Linting

```bash
npm run lint
npm run type-check
```

## 📁 Estrutura

```
src/
├── components/      # Componentes React reutilizáveis
├── pages/           # Páginas da aplicação
├── hooks/           # Hooks personalizados
├── services/        # Serviços de API
├── styles/          # Estilos Tailwind CSS
├── types/           # TypeScript types
├── utils/           # Funções utilitárias
├── App.tsx          # Componente raiz
└── main.tsx         # Entrada da aplicação
public/              # Assets estáticos
```

## 🎨 Tailwind CSS

O projeto está configurado com **Tailwind CSS** para estilização. Customize as cores em `tailwind.config.js`.

## 🔌 Comunicação com API

Use o serviço `api.ts` para fazer requisições ao backend:

```typescript
import { api } from '@/services/api'

const data = await api.get('/endpoint')
```

## 📚 Documentação

- [React Documentation](https://react.dev)
- [Vite Documentation](https://vitejs.dev)
- [Tailwind CSS Documentation](https://tailwindcss.com)
- [TypeScript Documentation](https://www.typescriptlang.org)
