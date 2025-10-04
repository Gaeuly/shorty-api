# shorty-api

![Ruby](https://img.shields.io/badge/Ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)
![Sinatra](https://img.shields.io/badge/Sinatra-%23711747.svg?style=for-the-badge&logo=sinatra&logoColor=white)
![JSON](https://img.shields.io/badge/JSON-%23000000.svg?style=for-the-badge&logo=json&logoColor=white)

## Project Description 📝

Shorty API is a lightweight URL shortener service built using Ruby and the Sinatra framework. It offers a simple and efficient way to shorten long URLs into more manageable and shareable links. This service addresses the common problem of unwieldy URLs that are difficult to remember, share, or embed in various applications.

The core functionality of Shorty API revolves around providing API endpoints for both creating shortened URLs and redirecting users to the original, longer URLs based on the shortened code.  The service receives a long URL, generates a unique short code, and stores the mapping between the short code and the long URL. When a user visits the shortened URL, the service looks up the corresponding long URL and redirects the user accordingly.

Shorty API is ideal for developers seeking a simple and easily deployable URL shortener solution for their projects or applications.  It's particularly useful for scenarios where brevity and readability of URLs are crucial, such as social media sharing, email campaigns, and analytics tracking.  The service stores its data in a plain JSON file, making it easy to set up and manage, although this approach is more suited for small to medium-sized projects where scalability is not a primary concern.

## Key Features ✨

*   **URL Shortening:** Takes a long URL as input and generates a unique short code, creating a shortened URL. This makes URLs more manageable and shareable.
*   **Redirection:**  Redirects users from the shortened URL to the original, long URL. Ensures seamless user experience when using shortened links.
*   **Simple API Endpoints:**  Provides clear and concise API endpoints for shortening URLs and redirecting users, making integration easy and straightforward.
*   **JSON Data Storage:** Stores URL mappings in a plain JSON file. Simplifies setup and management for small to medium-sized projects.
*   **Docker Support:** Includes a `Dockerfile` and `docker-compose.yml` for easy containerization and deployment. Enables consistent and reproducible environments.

## Tech Stack & Tools 🛠️

| Technology    | Description                                                                         |
|---------------|-------------------------------------------------------------------------------------|
| Ruby          | The primary programming language used to build the API.                                 |
| Sinatra       | A lightweight web framework in Ruby used for creating the API endpoints.               |
| Rack          | A modular interface between webservers and web applications.                          |
| JSON          | Used for data storage (urls.db) and handling API requests/responses.               |
| Docker        | Containerization platform for packaging and deploying the application.                  |
| Docker Compose| Tool for defining and managing multi-container Docker applications.                   |
| Bash          | Used for scripting in `entrypoint.sh` and `start.sh`.                               |

## Installation & Running Locally 🚀

1.  **Prerequisites:**

    *   Ruby (version 2.7 or higher)
    *   Bundler (for managing Ruby dependencies)
    *   Docker (if you want to run it in a container)
    *   Docker Compose (if you want to run it in a container using Docker Compose)

2.  **Clone the repository:**

    ```bash
    git clone https://github.com/Gaeuly/shorty-api.git
    ```

3.  **Navigate to the project directory:**

    ```bash
    cd shorty-api
    ```

4.  **Install Ruby dependencies:**

    ```bash
    bundle install
    ```

5.  **Run the database setup script (if needed - this should initialize urls.db):**

    ```bash
    ruby db_setup.rb
    ```

6.  **Start the application using `rackup`:**

    ```bash
    rackup config.ru
    ```

    This will start the server, usually on port 9292. You can access the API at `http://localhost:9292`.

    **Alternatively, using the start.sh script:**

    ```bash
    ./start.sh
    ```

7.  **Running with Docker Compose (Optional):**

    If you have Docker and Docker Compose installed, you can run the application using Docker Compose:

    ```bash
    docker-compose up --build
    ```

    This will build the Docker image and start the container, making the API accessible. The port will depend on the docker-compose configuration.

## How to Contribute 🤝

We welcome contributions to Shorty API! If you'd like to contribute, please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Make your changes.
4.  Write tests for your changes.
5.  Submit a pull request.

Please ensure your code adheres to the existing style and conventions.