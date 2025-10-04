#!/bin/bash

echo "Installing dependencies..."
bundle install

echo "Setting up database..."
ruby db_setup.rb

echo "Starting server with rackup..."
rackup