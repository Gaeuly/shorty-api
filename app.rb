require 'sinatra'
require 'json'

# Import our own URLStore class from the other file
require_relative 'url_store'

# Create a single instance of our store to manage data
store = URLStore.new

# --- Sinatra Configuration ---

# Set the port for the server
set :port, 4567
# Set the server to bind to all interfaces, useful for development
set :bind, '0.0.0.0'


# --- API Endpoints ---

# This block runs before every request
before do
  # We set the content type to json for all API responses
  content_type :json
end

# Endpoint to create a new short URL
# USAGE: POST /shorten with a JSON body like {"long_url": "https://www.google.com"}
post '/shorten' do
  begin
    request_payload = JSON.parse(request.body.read)
    long_url = request_payload['long_url']

    # Basic validation: ensure long_url is present and not empty
    if long_url.nil? || long_url.strip.empty?
      halt 400, { error: 'long_url is missing or empty' }.to_json
    end

    # Add the URL to our store and get the short code
    short_code = store.add(long_url)

    # Construct the full short URL
    short_url = "#{request.base_url}/#{short_code}"

    # Return a success response
    { short_url: short_url }.to_json
  rescue JSON::ParserError
    halt 400, { error: 'Invalid JSON format' }.to_json
  end
end

# Endpoint to handle redirection from a short URL
# USAGE: GET /<short_code>
get '/:short_code' do
  content_type 'text/html' # Set content type back to HTML for redirection
  short_code = params['short_code']
  long_url = store.find(short_code)

  if long_url
    # If the URL is found, redirect the user to it permanently (301)
    redirect long_url, 301
  else
    # If not found, return a 404 error
    content_type :json # Set back to JSON for error message
    halt 404, { error: 'Short URL not found' }.to_json
  end
end