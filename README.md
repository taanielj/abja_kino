# Abja Kino Project

This repository contains the Docker Compose setup for the Abja Kino cinema application, which includes a frontend, backend, and a PostgreSQL database. The project also utilizes an Nginx reverse proxy for added security and routing.

## Project Structure (Docker Compose)

* Backend:
    - Spring Boot application with JWT stateless authentication for running the API
    - localhost:8080 )(internal network)
* Frontend:
    - Vue.js application for running the frontend
    - localhost:8081 (internal network)
* Database:
    - PostgreSQL database for storing the data
    - localhost:5432 (internal network)
* Proxy:
    - Nginx reverse proxy
    - localhost:80 (external network)
    - localhost:443 (external network)

## Setup

### Prerequisites

- Docker and Docker Compose installed.
- Domain set up (in this case, using DuckDNS).
- SSL certificates (using Let's Encrypt).

### Steps

0. Prerequisites:
* Download and install [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/).

* Register a domain name and set up SSL certificates. In this case, I used [DuckDNS](https://www.duckdns.org/). You can use [Certbot](https://certbot.eff.org/) to generate the TLS certificates (for HTTPS)

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/taanielj/abja_kino_deployment.git
   ```

    Then clone the submodules
    ```bash
    git submodule update --init --recursive
    ```



2. **Environment Variables**:
   - Create a `.env` file in the root directory.
   - Add necessary environment variables (e.g., `POSTGRES_USER`, `POSTGRES_PASSWORD`, etc.).

3. **Run Docker Compose**:
   ```
   docker-compose up -d
   ```

4. **Access the Application**:
   - Open a browser and navigate to `https://abjakino.duckdns.org/`.




## Feedback & Contributions

Feel free to open issues or pull requests if you have suggestions, improvements, or fixes.

