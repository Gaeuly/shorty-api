require 'json'
require 'securerandom'

# This class is responsible for all interactions with our database file (urls.json).
class URLStore
  DB_FILE = 'urls.json'.freeze

  def initialize
    # Initialize by loading existing data from the JSON file.
    @data = load_data
  end

  # Adds a new long URL and returns its short code.
  def add(long_url)
    short_code = generate_unique_short_code
    @data[short_code] = long_url
    save_to_file
    short_code
  end

  # Finds the original long URL based on a short code.
  def find(short_code)
    @data[short_code]
  end

  private

  # Loads data from the JSON file.
  # If the file doesn't exist or is empty, return an empty Hash.
  def load_data
    return {} unless File.exist?(DB_FILE)
    
    file_content = File.read(DB_FILE)
    file_content.empty? ? {} : JSON.parse(file_content)
  rescue JSON::ParserError
    # If the JSON file is malformed, treat it as empty.
    {}
  end

  # Saves the current data (a Hash) to the JSON file in a pretty format.
  def save_to_file
    File.write(DB_FILE, JSON.pretty_generate(@data))
  end

  # Generates a unique 6-character alphanumeric code.
  def generate_unique_short_code
    loop do
      code = SecureRandom.alphanumeric(6)
      # Return the code only if it's not already in our database.
      return code unless @data.key?(code)
    end
  end
end
