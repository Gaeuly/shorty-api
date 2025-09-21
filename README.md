# Shorty API

Shorty API — a minimal, fast, and lightweight URL shortener API service built with Ruby and Sinatra.  
This project provides simple API endpoints to create a short version of a long URL and redirect users to the original URL.  
It uses a simple JSON file as its database.

---

## Features
- Create short URLs from long URLs via a POST request  
- Redirects short URLs to their original destination  
- Stateless design, using a plain JSON file for data storage  
- Built with a lightweight stack for speed  

---

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites
Make sure you have the following installed on your system:
- Ruby  
- Bundler (`gem install bundler`)  

### Installation & Running
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/shorty-api.git

(Replace your-username with your actual GitHub username)

2. Navigate into the project directory:

cd shorty-api


3. Install the required gems:

bundle install


4. Run the API server:

bundle exec puma



The API will now be running at:
👉 http://localhost:4567


---

API Usage

You can interact with the API using any HTTP client, such as curl or Postman.

1. Create a Short URL

Method: POST

Endpoint: /shorten

Body (JSON):

{ "long_url": "https://www.your-long-url.com/goes/here" }


Example Request with curl:

curl -X POST \
-H "Content-Type: application/json" \
-d '{"long_url": "https://en.wikipedia.org/wiki/Ruby_(programming_language)"}' \
http://localhost:4567/shorten

Example Success Response (200 OK):

{ "short_url": "http://localhost:4567/xY2zAb" }


---

2. Redirect to Long URL

Method: GET

Endpoint: /:short_code


Example Usage:
Visit:

http://localhost:4567/xY2zAb

Result:
You will be immediately redirected to:

https://en.wikipedia.org/wiki/Ruby_(programming_language)
