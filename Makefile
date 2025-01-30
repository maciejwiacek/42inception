DOCKER_COMPOSE = docker-compose -f ./srcs/docker-compose.yml
DATA_DIR = $(HOME)/data

all:
	@mkdir -p $(DATA_DIR)/wordpress
	@mkdir -p $(DATA_DIR)/mariadb
	@$(DOCKER_COMPOSE) up -d


down:
	@$(DOCKER_COMPOSE) down --volumes --remove-orphans

stop:
	@$(DOCKER_COMPOSE) stop

start:
	@$(DOCKER_COMPOSE) start

clean:
	@docker stop $$(docker ps -qa) 2>/dev/null || true; \
	docker rm $$(docker ps -qa) 2>/dev/null || true; \
	dockerm rmi -f $$(docker images -qa) 2>/dev/null || true; \
	docker volume rm $$(docker volume ls -q) 2>/dev/null || true; \
	docker network prune -f; \
	rm -rf $(DATA_DIR)/wordpress; \
	rm -rf $(DATA_DIR)/mariadb

re: clean all

.PHONY: all init_dirs down stop start clean re
