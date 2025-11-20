# Use the official Jekyll image as base
# This image already has Ruby, Jekyll, and all dependencies pre-installed
# Purpose: Start with a known-good environment instead of installing everything from scratch
# Using 'builder' tag which includes Ruby 2.7 compatible with github-pages gem
FROM jekyll/jekyll:builder

# Set the working directory inside the container
# Purpose: All commands will run from this directory
WORKDIR /srv/jekyll

# Copy the Gemfile
# Purpose: Docker caches layers - if dependencies don't change, we don't need to reinstall gems
# This is called "layer caching" and speeds up builds
# Note: Gemfile.lock is optional - bundle install will work without it
COPY --chown=jekyll:jekyll Gemfile ./

# Install dependencies
# Purpose: Install all Ruby gems (Jekyll, plugins, etc.) before copying source code
# This way, if only content changes, we don't reinstall gems
# Install to local vendor/bundle directory to avoid permission issues
USER jekyll
RUN gem update --system && \
    bundle config set --local path 'vendor/bundle' && \
    bundle install
USER root

# Copy the rest of the site files
# Purpose: Now copy all your blog posts, configs, assets, etc.
# Use --chown to set proper ownership for the jekyll user
COPY --chown=jekyll:jekyll . .

# Set environment variable for GitHub Pages
# Purpose: Jekyll needs repository information for GitHub Pages features
ENV PAGES_REPO_NWO=TaleOfFriendship/TaleOfFriendship.github.io

# Expose port 4000
# Purpose: Jekyll's default port. This tells Docker which port the container will use
EXPOSE 4000

# Set the default command
# Purpose: When container starts, automatically run Jekyll in watch mode
# --force_polling is needed for Docker on Windows/Mac (file system watching issues)
# --livereload enables auto-refresh in browser when files change
CMD ["jekyll", "serve", "--force_polling", "--livereload", "--host", "0.0.0.0"]
