COMPOSE = docker-compose -f ./srcs/docker-compose.yml

all: up

up:
	@$(COMPOSE) up -d --build

down:
	@$(COMPOSE) down

.PHONY: all up down
