## Inception

This project sets up a WordPress site with a MariaDB database using Docker and Docker Compose.

### Prerequisites

- Docker
- Docker Compose

### Project Structure

- `docker-compose.yml`: Defines the services and their configurations.
- `Makefile`: Contains commands to manage the Docker environment.
- `requirements/`: Contains Dockerfiles and configuration scripts for each service.
    - `mariadb/`: MariaDB service configuration.
    - `nginx/`: Nginx service configuration.
    - `wordpress/`: WordPress service configuration.
- `.env.example`: Example environment variables file.

### Setup

1. Copy the example environment file and update it with your own values:
     ```sh
     cp .env.example .env
     ```

2. Build and start the services:
     ```sh
     sudo make all
     ```

### Accessing the Services

- **WordPress**: `https://<your-domain>`
- **MariaDB**: Accessible within the Docker network.

### Stopping the Services

To stop the services, run:
```sh
sudo make down
```

