.PHONY: help dev dev-up dev-down build prod-up prod-down clean logs install

help:
	@echo "Comandos disponíveis:"
	@echo ""
	@echo "Desenvolvimento:"
	@echo "  make dev          - Inicia ambiente de desenvolvimento com Docker"
	@echo "  make dev-up       - Inicia containers de dev em background"
	@echo "  make dev-down     - Para containers de dev"
	@echo "  make dev-logs     - Exibe logs de desenvolvimento"
	@echo ""
	@echo "Produção:"
	@echo "  make prod-up      - Inicia ambiente de produção"
	@echo "  make prod-down    - Para ambiente de produção"
	@echo ""
	@echo "Gerais:"
	@echo "  make build        - Faz build dos containers"
	@echo "  make clean        - Remove containers e volumes"
	@echo "  make install      - Instala dependências (sem Docker)"
	@echo ""

# Desenvolvimento com Docker
dev:
	docker compose --env-file .env.local -f docker/docker-compose.dev.yml up --build

dev-up:
	docker compose --env-file .env.local -f docker/docker-compose.dev.yml up -d

dev-down:
	docker compose --env-file .env.local -f docker/docker-compose.dev.yml down

dev-logs:
	docker compose --env-file .env.local -f docker/docker-compose.dev.yml logs -f

# Produção com Docker
prod-up:
	docker compose -f docker/docker-compose.prod.yml up -d

prod-down:
	docker compose -f docker/docker-compose.prod.yml down

# Build
build:
	docker compose --env-file .env.local -f docker/docker-compose.dev.yml build

build-prod:
	docker compose --env-file .env.local -f docker/docker-compose.prod.yml build

# Limpeza
clean:
	docker compose --env-file .env.local -f docker/docker-compose.dev.yml down -v
	docker compose --env-file .env.local -f docker/docker-compose.prod.yml down -v

# Instalação local
install:
	cd backend && npm install
	cd ../frontend && npm install

# Executar backend localmente
run-backend:
	cd backend && npm run dev

# Executar frontend localmente
run-frontend:
	cd frontend && npm run dev

# Prisma
prisma-generate:
	cd backend && npm run prisma:generate

prisma-migrate:
	cd backend && npm run prisma:migrate

prisma-studio:
	cd backend && npm run prisma:studio
