#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Run the database setup script.
# This ensures the database and table exist.
echo "Running database setup..."
bundle exec ruby db_setup.rb

# Then exec the container's main process (what's set as CMD in the Dockerfile).
# 'exec "$@"' allows us to pass command-line arguments to the script.
exec "$@"