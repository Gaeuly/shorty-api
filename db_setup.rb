require 'sequel'
require 'fileutils'

# Create a 'db' directory if it doesn't exist
FileUtils.mkdir_p('db')

# Connect to a SQLite database inside the 'db' directory
DB = Sequel.connect('sqlite://db/urls.db')

DB.create_table? :urls do
  primary_key :id
  String :long_url, null: false
  String :short_code, null: false, unique: true, index: true
  Integer :click_count, default: 0
  DateTime :created_at
end

puts "Database 'db/urls.db' and table 'urls' are ready."