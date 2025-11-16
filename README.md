# Statistics Tidbits

A personal blog about data science, statistics, and machine learning. Just rambling, occasionally making sense.

## About

This is a Jekyll-based blog hosted on GitHub Pages. The site is built using the [Jekyll Midnight theme](https://github.com/pages-themes/midnight).

## Setup

### Prerequisites

- Ruby (2.5.0 or higher)
- Bundler gem

### Installation

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

### Local Development

To run the site locally:

```bash
cd docs
bundle exec jekyll serve
```

The site will be available at `http://localhost:4000`

### Building for Production

To build the site without serving:

```bash
cd docs
bundle exec jekyll build
```

The built site will be in the `docs/_site` directory.

## Project Structure

```
.
├── docs/              # Main Jekyll site directory
│   ├── _config.yml   # Jekyll configuration
│   ├── _posts/       # Blog posts (Markdown files)
│   ├── _layouts/     # Page layouts
│   ├── assets/       # Images and other assets
│   └── index.html    # Homepage
├── .gitignore        # Git ignore rules
├── .editorconfig     # Editor configuration
├── .gitattributes    # Git attributes for line endings
└── README.md         # This file
```

## Writing Posts

Create new posts in `docs/_posts/` with the naming convention:
```
YYYY-MM-DD-post-title.markdown
```

## Deployment

The site is automatically deployed via GitHub Pages when changes are pushed to the repository. GitHub Pages will build the site from the `docs/` directory.

## Technologies

- [Jekyll](https://jekyllrb.com/) - Static site generator
- [GitHub Pages](https://pages.github.com/) - Hosting
- [Jekyll Midnight Theme](https://github.com/pages-themes/midnight) - Theme

## License

See [LICENSE](LICENSE) file for details.
