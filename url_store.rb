require 'sequel'
require 'securerandom'

# Connect to the database file
DB = Sequel.connect('sqlite://urls.db')

# Define the model that maps to the 'urls' table.
# This makes it easy to interact with the table rows as objects.
class Url < Sequel::Model; end

# This class is now responsible for all interactions with our database.
class URLStore
  # Adds a new long URL to the database and returns its short code.
  def add(long_url)
    short_code = generate_unique_short_code
    
    # Create a new record in the 'urls' table
    Url.create(
      long_url: long_url,
      short_code: short_code,
      created_at: Time.now
    )
    
    short_code
  end

  # Finds the original long URL based on a short code.
  def find(short_code)
    record = Url.first(short_code: short_code)
    
    if record
      # If found, increment the click count. A nice new feature!
      record.update(click_count: record.click_count + 1)
      return record.long_url
    end
    
    nil # Return nil if not found
  end

  private

  # Generates a unique 6-character alphanumeric code.
  # It checks the database to make sure the code is not already in use.
  def generate_unique_short_code
    loop do
      code = SecureRandom.alphanumeric(6)
      return code if Url.first(short_code: code).nil?
    end
  end
end