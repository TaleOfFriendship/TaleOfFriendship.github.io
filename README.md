# Statistics Tidbits

A personal blog about data science, statistics, and machine learning. Just rambling, occasionally making sense.

## About

This is a Jekyll-based blog hosted on GitHub Pages. The site is built using the [Jekyll Midnight theme](https://github.com/pages-themes/midnight).

## Setup

### Option 1: Using Docker (Recommended)

**Prerequisites:**
- Docker Desktop installed ([Download here](https://www.docker.com/products/docker-desktop))

**Why Docker?**
- No need to install Ruby or Jekyll locally
- Consistent environment across different machines
- Easy to share with others
- Isolated environment for development

**Steps:**

1. Clone the repository:
   ```bash
   git clone https://github.com/TaleOfFriendship/TaleOfFriendship.github.io.git
   cd TaleOfFriendship.github.io/docs
   ```

2. Build and run with Docker Compose:
   ```bash
   docker-compose up
   ```
   
   **What this does:**
   - Builds a Docker image with Jekyll and all dependencies
   - Starts a container running Jekyll
   - Mounts your files so changes are reflected immediately
   - Makes the site available at `http://localhost:4000`

3. Access your site:
   - Open `http://localhost:4000` in your browser
   - The site auto-reloads when you change files

4. Stop the container:
   - Press `Ctrl+C` in the terminal
   - Or run: `docker-compose down`

**Docker Commands Explained:**
- `docker-compose up` - Build and start containers
- `docker-compose down` - Stop and remove containers
- `docker-compose build` - Rebuild the image (if Dockerfile changes)
- `docker-compose logs` - View Jekyll output logs

### Option 2: Local Installation (Traditional Method)

**Prerequisites:**
- Ruby (2.5.0 or higher)
- Bundler gem

**Steps:**

1. Clone the repository:
   ```bash
   git clone https://github.com/TaleOfFriendship/TaleOfFriendship.github.io.git
   cd TaleOfFriendship.github.io
   ```

2. Navigate to the docs directory:
   ```bash
   cd docs
   ```

3. Install dependencies:
   ```bash
   bundle install
   ```

4. Run the site locally:
   ```bash
   bundle exec jekyll serve
   ```

   The site will be available at `http://localhost:4000`

5. Build for production:
   ```bash
   bundle exec jekyll build
   ```

   The built site will be in the `docs/_site` directory.

## Project Structure

```
.
├── docs/                      # Main Jekyll site directory
│   ├── _config.yml           # Jekyll configuration
│   ├── _posts/               # Blog posts (Markdown files)
│   ├── _layouts/             # Page layouts
│   ├── assets/               # Images and other assets
│   ├── Dockerfile            # Docker image definition
│   ├── docker-compose.yml    # Docker Compose configuration
│   ├── .dockerignore         # Files to exclude from Docker build
│   └── index.html            # Homepage
├── .github/
│   └── workflows/
│       └── jekyll.yml        # GitHub Actions CI/CD pipeline
├── .gitignore                # Git ignore rules
├── .editorconfig             # Editor configuration
├── .gitattributes            # Git attributes for line endings
└── README.md                 # This file
```

## Writing Posts

Create new posts in `docs/_posts/` with the naming convention:
```
YYYY-MM-DD-post-title.markdown
```

## CI/CD Pipeline

This project supports multiple CI/CD solutions:

### GitHub Actions (Currently Active)

**What it does:**
- **On every push**: Automatically builds and tests your Jekyll site
- **On pull requests**: Tests that changes don't break the site
- **Docker build test**: Verifies the Dockerfile works correctly

**View CI/CD status:**
- Go to the "Actions" tab in your GitHub repository
- See build logs and test results

### Jenkins (Optional)

The repository includes a `Jenkinsfile` for Jenkins CI/CD.

**Setup:**
- See `docs/jenkins-setup.md` for detailed setup instructions
- Two versions available:
  - `Jenkinsfile` - Full pipeline with Docker
  - `Jenkinsfile.simple` - Simple version without Docker

**Benefits of Jenkins:**
- Self-hosted (full control)
- Highly customizable
- Can run alongside GitHub Actions

**Benefits of GitHub Actions:**
- Cloud-hosted (no server needed)
- Easy setup
- Integrated with GitHub
- Free for public repositories

**Benefits:**
- Catch errors before they reach production
- Ensure site always builds successfully
- Automated testing and deployment

## Deployment

The site is automatically deployed via GitHub Pages when changes are pushed to the repository. GitHub Pages will build the site from the `docs/` directory.

**Deployment Process:**
1. Push changes to `master` branch
2. GitHub Pages automatically detects the push
3. Builds the Jekyll site (takes 1-2 minutes)
4. Deploys to `https://taleoffriendship.github.io`
5. Your site is live!

## Technologies

- [Jekyll](https://jekyllrb.com/) - Static site generator
- [GitHub Pages](https://pages.github.com/) - Hosting
- [Jekyll Midnight Theme](https://github.com/pages-themes/midnight) - Theme

## License

See [LICENSE](LICENSE) file for details.
