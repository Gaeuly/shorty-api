require 'sinatra'
require 'json'
require 'uri' # Required for URL validation

require_relative 'url_store'

store = URLStore.new

set :port, 4567
set :bind, '0.0.0.0'

before do
  content_type :json
end

# --- Helper for URL Validation ---
def valid_url?(url)
  # A simple check for a valid URI format (http or https)
  uri = URI.parse(url)
  uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
rescue URI::InvalidURIError
  false
end

# --- API Endpoints ---

post '/shorten' do
  begin
    request_payload = JSON.parse(request.body.read)
    long_url = request_payload['long_url']

    if long_url.nil? || long_url.strip.empty?
      halt 400, { error: 'long_url is missing or empty' }.to_json
    end

    # ADDED: URL Validation
    unless valid_url?(long_url)
      halt 400, { error: 'Invalid URL format' }.to_json
    end

    short_code = store.add(long_url)
    short_url = "#{request.base_url}/#{short_code}"

    status 201 # Use 201 Created for successful resource creation
    { short_url: short_url }.to_json
  rescue JSON::ParserError
    halt 400, { error: 'Invalid JSON format' }.to_json
  end
end

# NEW ENDPOINT: Get stats for a short URL
get '/stats/:short_code' do
  short_code = params['short_code']
  record = store.find_with_stats(short_code)

  if record
    {
      long_url: record.long_url,
      short_code: record.short_code,
      click_count: record.click_count,
      created_at: record.created_at
    }.to_json
  else
    halt 404, { error: 'Short URL not found' }.to_json
  end
end

get '/:short_code' do
  content_type 'text/html'
  short_code = params['short_code']
  long_url = store.find(short_code)

  if long_url
    redirect long_url, 301
  else
    content_type :json
    halt 404, { error: 'Short URL not found' }.to_json
  end
end