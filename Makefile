.PHONY: dev dev-down dev-logs dev-restart dev-ps \
        mon mon-down mon-logs mon-restart mon-ps \
        prod prod-down prod-logs prod-restart prod-ps \
        prune clean

### --- DEV (backend only) ---

dev:
	docker compose -f docker-compose.dev.yaml --env-file .env.dev up -d --build

dev-down:
	docker compose -f docker-compose.dev.yaml down

dev-logs:
	docker compose -f docker-compose.dev.yaml logs -f

dev-restart:
	docker compose -f docker-compose.dev.yaml restart

dev-ps:
	docker compose -f docker-compose.dev.yaml ps


### --- MONITORING (Prometheus + Grafana + Loki + Promtail) ---

mon:
	docker compose -f docker-compose.monitoring.yaml --env-file .env.dev up -d --build

mon-down:
	docker compose -f docker-compose.monitoring.yaml down

mon-logs:
	docker compose -f docker-compose.monitoring.yaml logs -f

mon-restart:
	docker compose -f docker-compose.monitoring.yaml restart

mon-ps:
	docker compose -f docker-compose.monitoring.yaml ps


### --- PROD (full stack) ---

prod:
	docker compose -f docker-compose.prod.yaml --env-file .env.prod up -d --build

prod-down:
	docker compose -f docker-compose.prod.yaml down

prod-logs:
	docker compose -f docker-compose.prod.yaml logs -f

prod-restart:
	docker compose -f docker-compose.prod.yaml restart

prod-ps:
	docker compose -f docker-compose.prod.yaml ps


### --- CLEANUP ---

prune:
	docker system prune -a --volumes -f

clean: prune
