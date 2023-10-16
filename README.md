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

* Generate a deployment keys for the repositories:
    * Generate a key pair:
    ```bash
    ssh-keygen -t ed25519 -C "abja-kino-deployment-key" -f ~/.ssh/abja-kino-deployment-key
    ssh-keygen -t ed25519 -C "abja-kino-back-key" -f ~/.ssh/abja-kino-back-key
    ssh-keygen -t ed25519 -C "abja-kino-front-key" -f ~/.ssh/abja-kino-front-key
    ```
    ```
    ```
    ss
    ```
    * Add the public key to the respective repositories (e.g., `abja_kino_deployment`, `abja_kino_front`, `abja_kino_back`).
    * Add the private keys to the server (e.g., `~/.ssh/abja-kino-deployment`).
    * Add the following to `~/.ssh/config`:
    ```
    Host github.com-abja-kino-deployment
        HostName github.com
        User git
        IdentityFile ~/.ssh/abja-kino-deployment-key

    Host github.com-abja-kino-back
        HostName github.com
        User git
        IdentityFile ~/.ssh/abja-kino-back-key

    Host github.com-abja-kino-front
        HostName github.com
        User git
        IdentityFile ~/.ssh/abja-kino-front-key

    
    ```
    Set permission for .ssh folder and contents:
    ```bash
    chmod 700 ~/.ssh   # Sets permission for .ssh folder to 700 (allows read/write/execute for owner only (drwx------)
    chmod 600 ~/.ssh/* # Sets permission for all files in .ssh folder to 600 (allows read/write for owner only (rw-------)
    ls -la ~/.ssh      # Check permissions
    ```



1. **Clone the Repository**:
   ```bash
   git clone git@github.com-abja-kino-deployment:taanielj/abja_kino_deployment.git
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

