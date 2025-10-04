# 1. Start from an official Ruby image
FROM ruby:3.1-slim-bullseye

# 2. Set the working directory inside the container
WORKDIR /usr/src/app

# 3. Install essential packages
RUN apt-get update -qq && apt-get install -y build-essential

# 4. Copy the Gemfile and Gemfile.lock to install dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# 5. Copy the rest of the application code into the container
COPY . .

# 6. Make the entrypoint script executable
RUN chmod +x /usr/src/app/entrypoint.sh

# 7. Expose the port the app runs on
EXPOSE 4567

# 8. Define the command to run when the container starts
CMD ["rackup", "--host", "0.0.0.0", "-p", "4567"]