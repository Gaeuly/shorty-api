# Shorty API

[![Ruby](https://img.shields.io/badge/Ruby-%23CC342D.svg?style=for-the-badge&logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![Sinatra](https://img.shields.io/badge/Sinatra-%23762A24.svg?style=for-the-badge&logo=sinatra&logoColor=white)](https://sinatrarb.com/)
[![License: Unlicensed](https://img.shields.io/badge/License-Unlicensed-red.svg)](https://unlicense.org/)

## Project Description 📝

Shorty API is a lightweight and efficient URL shortening service built with Ruby and the Sinatra framework. This API provides a simple and straightforward way to shorten long URLs into shorter, more manageable links.  It addresses the common problem of cumbersome URLs that are difficult to share and track, especially in contexts like social media, email marketing, or presentations.

The API exposes endpoints for creating shortened URLs from long ones and for redirecting users from the shortened URL to the original destination.  The data, consisting of the mapping between short URLs and their corresponding long URLs, is stored in a plain JSON file (`urls.db`), making the service easy to set up and deploy without the need for a complex database system.  This design choice emphasizes simplicity and portability.

Shorty API is ideal for developers and small businesses who need a simple, self-hosted URL shortening solution without the overhead of managing a full-fledged database.  It's also a great learning project for understanding the fundamentals of web API development with Ruby and Sinatra. The lack of an explicit license means the code is likely not free for commercial use - this aspect should be clarified with the owner.

## Key Features ✨

*   **URL Shortening:** Converts long URLs into shorter, more shareable links.
*   **Redirection:** Redirects users from the shortened URL to the original URL seamlessly.
*   **Simple Data Storage:** Utilizes a JSON file (`urls.db`) for storing URL mappings, eliminating the need for a database.
*   **Lightweight and Fast:** Built with Ruby and Sinatra for a fast and efficient API.
*   **Easy Setup:** Simple to install and run locally, requiring minimal configuration.

## Tech Stack & Tools 🛠️

| Technology   | Description                                                                  |
| :----------- | :--------------------------------------------------------------------------- |
| Ruby         | The primary programming language used to build the API.                     |
| Sinatra      | A lightweight Ruby web framework used for creating the API endpoints.        |
| `Gemfile`     | Specifies the project's dependencies and versions.                           |
| `config.ru`   | Rack configuration file for running the Sinatra application.               |
| `urls.db`    | JSON file used for persistent storage of shortened URLs and their originals. |
| `url_store.rb`| Ruby module responsible for handling the storage and retrieval of URLs |
| `db_setup.rb`| Ruby script to create and initialize the database (`urls.db`). |

## Installation & Running Locally 🚀

Follow these steps to install and run Shorty API locally:

1.  **Prerequisites:**

    *   Ruby (version 2.7 or higher is recommended)
    *   Bundler (Ruby package manager) - Install with `gem install bundler`

2.  **Clone the repository:**

    ```bash
    git clone https://github.com/Gaeuly/shorty-api.git
    ```

3.  **Navigate to the project directory:**

    ```bash
    cd shorty-api
    ```

4.  **Install dependencies using Bundler:**

    ```bash
    bundle install
    ```

5.  **Initialize the database (create `urls.db`):**

    ```bash
    ruby db_setup.rb
    ```

6.  **Run the application:**

    ```bash
    ruby app.rb
    ```

    or

    ```bash
    rackup config.ru
    ```

    The API will be available at `http://localhost:4567`.

## How to Contribute 🤝

We welcome contributions to Shorty API! If you'd like to contribute, please follow these steps:

1.  Fork the repository.
2.  Create a new branch for your feature or bug fix.
3.  Implement your changes and write tests.
4.  Submit a pull request with a clear description of your changes.