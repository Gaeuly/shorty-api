require 'sequel'

# Connect to a SQLite database.
# The file 'urls.db' will be created if it doesn't exist.
DB = Sequel.connect('sqlite://urls.db')

# Create a 'urls' table if it doesn't exist.
# This is where we'll store our URL data.
DB.create_table? :urls do
  primary_key :id
  String :long_url, null: false
  String :short_code, null: false, unique: true, index: true
  Integer :click_count, default: 0 # We'll add this for future features!
  DateTime :created_at
end

puts "Database 'urls.db' and table 'urls' created successfully."
puts "You can now run the main app."