# Use the official Jekyll image as base
# This image already has Ruby, Jekyll, and all dependencies pre-installed
# Purpose: Start with a known-good environment instead of installing everything from scratch
FROM jekyll/jekyll:4.2.2

# Set the working directory inside the container
# Purpose: All commands will run from this directory
WORKDIR /srv/jekyll

# Copy the Gemfile and Gemfile.lock first
# Purpose: Docker caches layers - if dependencies don't change, we don't need to reinstall gems
# This is called "layer caching" and speeds up builds
COPY Gemfile Gemfile.lock ./

# Install dependencies
# Purpose: Install all Ruby gems (Jekyll, plugins, etc.) before copying source code
# This way, if only content changes, we don't reinstall gems
RUN bundle install

# Copy the rest of the site files
# Purpose: Now copy all your blog posts, configs, assets, etc.
COPY . .

# Expose port 4000
# Purpose: Jekyll's default port. This tells Docker which port the container will use
EXPOSE 4000

# Set the default command
# Purpose: When container starts, automatically run Jekyll in watch mode
# --force_polling is needed for Docker on Windows/Mac (file system watching issues)
# --livereload enables auto-refresh in browser when files change
CMD ["jekyll", "serve", "--force_polling", "--livereload", "--host", "0.0.0.0"]

