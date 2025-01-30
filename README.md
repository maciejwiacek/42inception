# Inception - Dockerized WordPress Environment
Inception is a project designed to introduce Docker and container orchestration.

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Requirements](#requirements)
- [Usage](#usage)
- [Gained Knowledge](#gained-knowledge)

## Overview
The goal is to create a fully functional WordPress website by setting up and linking three Docker containers: Nginx, WordPress (PHP-FPM), and MariaDB. This project reinforces an understanding of virtualization, networking, and container management.

## Features
- Dockerized environment: Each service runs in its own isolated container.
- Nginx Web Server: Serves as a reverse proxy for WordPress.
- WordPress with PHP-FPM: A containerized WordPress installation running PHP-FPM for optimized performance.
- MariaDB Database: A database container to store WordPress content.
- Docker Compose: Automates the deployment of all services.

## Requirements:
- Set up a multi-container environment using Docker.
- Configure Docker Compose to manage dependencies and networking.
- Ensure data persistence using Docker volumes.
- Secure the environment with proper permissions and configurations.
- Connect all containers to provide a functional WordPress site.

## Usage
1. Clone the repository
```bash
git clone https://github.com/maciejwiacek/42inception.git && cd 42inception
```
2. Create a .env file
```bash
DOMAIN_NAME=

ADMIN_LOGIN=
ADMIN_PASSWORD=
ADMIN_EMAIL=

USER_LOGIN=
USER_PASSWORD=
USER_EMAIL=
```
3. Build and start the containers
```bash
make
```

4. Access WordPress
   <br />In a browser go to https://localhost
5. Stop the environment
```bash
make clean
```

## Gained Knowledge:
- Understanding of Docker and containerization.
- Experience with Docker Compose to manage multi-container applications.
- Configuration and deployment of Nginx, WordPress, and MariaDB.
- Networking concepts for inter-container communication.
- Data persistence with Docker volumes.
