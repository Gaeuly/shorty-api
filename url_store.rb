require 'sequel'
require 'securerandom'

# Move the database file into a 'db' directory for better organization
DB = Sequel.connect('sqlite://db/urls.db')

class Url < Sequel::Model; end

class URLStore
  def add(long_url)
    short_code = generate_unique_short_code
    Url.create(
      long_url: long_url,
      short_code: short_code,
      created_at: Time.now
    )
    short_code
  end

  def find(short_code)
    record = Url.first(short_code: short_code)
    if record
      record.update(click_count: record.click_count + 1)
      return record.long_url
    end
    nil
  end

  # NEW METHOD: Find a URL and return its stats without incrementing the click count.
  def find_with_stats(short_code)
    Url.first(short_code: short_code)
  end

  private

  def generate_unique_short_code
    loop do
      code = SecureRandom.alphanumeric(6)
      return code unless Url.first(short_code: code)
    end
  end
end