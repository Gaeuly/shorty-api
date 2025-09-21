# shorty-api

[![Ruby](https://img.shields.io/badge/ruby-%23CC3428?style=for-the-badge&logo=ruby)](https://www.ruby-lang.org/)
[![Sinatra](https://img.shields.io/badge/sinatra-%23000000.svg?style=for-the-badge&logo=sinatra)](https://www.sinatrarb.com/)
[![JSON](https://img.shields.io/badge/json-%23000000.svg?style=for-the-badge&logo=json)](https://www.json.org/)


## Description 📝

Shorty API is a lightweight and easy-to-use URL shortening service built with Ruby and Sinatra.  It offers a simple API for shortening long URLs and redirecting users to the shortened links.  Data persistence is handled efficiently using a plain JSON file, making it ideal for learning and experimentation. This project is a great example of building a functional API with minimal dependencies.


## Key Features ✨

*   **Simple API:** Clean and straightforward API endpoints for URL shortening and redirection.
*   **Lightweight:** Minimal dependencies for easy setup and maintenance.
*   **JSON Data Storage:** Uses a JSON file for persistent storage of URLs.
*   **Fast and Efficient:**  Provides quick response times for both shortening and redirection requests.
*   **Easy to Deploy:**  Minimal configuration needed for deployment.


## Tech Stack 🛠️

*   Ruby
*   Sinatra
*   JSON


## Installation & Running 🚀

1. Clone the repository:
   ```bash
   git clone https://github.com/Gaeuly/shorty-api.git
   ```

2. Navigate to the project directory:
   ```bash
   cd shorty-api
   ```

3. Install the required gems:
   ```bash
   bundle install
   ```

4. Run the application:
   ```bash
   ruby app.rb
   ```

5.  The API will be running on `http://localhost:4567/`.  You can now send POST requests to `/shorten` with the long URL in the body to get a shortened URL.


## How to Contribute 🤝

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with clear and concise messages.
4. Push your branch to your forked repository.
5. Create a pull request to the main repository.
