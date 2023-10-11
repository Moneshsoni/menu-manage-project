# Use an official Ruby runtime as a parent image
FROM ruby:3.0.0

# #Install node
# RUN apt-get update && apt-get install -y nodejs

# #install bundler
# RUN gem install bundler:2.2.22

# # create directory where we will keep our code.
# RUN mkdir /app

# #Change directory
# WORKDIR /app

# # Copy Gemfile and Gemfile.lock
# COPY Gemfile* ./    

# # Run bundle install only after copying gemfile
# RUN ["bundle", "install"]

# # Copy whole code
# COPY . .

# # Run Server
# ## CMD can only be one in one gemfile
# CMD ["./bin/docker-entrypoint.sh"]

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./

# Install dependencies using Bundler
RUN bundle install

# Copy the rest of your application code into the container
COPY . .

# Expose port 3000 for the Rails application
EXPOSE 3000

# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0"]





# Commands to create and run this image

# $ docker build --no-cache -t rails .
# $ docker run rails
