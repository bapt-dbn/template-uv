# template-uv

[Copier](https://github.com/copier-org/copier) template that allows quickly creating the arborescence of a Python project managed by [uv](https://astral.sh/blog/uv)

## 🧪 Features 🧪

- [X] [uv](https://astral.sh/blog/uv) setup, with pre-defined `pyproject.toml`
- [X] Documentation built with [MkDocs](https://github.com/mkdocs/mkdocs) ([Material theme](https://github.com/squidfunk/mkdocs-material))
- [X] Pre-configured tools for code formatting, quality analysis and testing:
  - [X] [ruff](https://github.com/charliermarsh/ruff)
- [X] Tests run with [pytest](https://github.com/pytest-dev/pytest) and plugins, with [coverage](https://github.com/nedbat/coveragepy) support
- [X] Cross-platform tasks with [invoke](https://www.pyinvoke.org/)
- [X] Python 3.12 support
- [ ] Auto-generated `CHANGELOG.md` from git commits with usage of [commitizen](https://commitizen-tools.github.io/commitizen/)
- [X] Pre-configured [GitHub Actions](https://docs.github.com/en/actions) workflows
- [X] Pre-configured [GitLab CI/CD](https://docs.gitlab.com/ee/ci/) pipelines

## 🚀 Quick setup and usage 🚀

```bash
pipx install copier
pipx inject copier copier-templates-extensions
copier copy --trust "https://github.com/bapt-dbn/template-uv.git" .
```

Then, create a new repository with the same name as the project and push the code to it.

```bash
git init
git remote add origin <YOUR_REPOSITORY_URL>
git branch -M main
git add .
git commit -m "added(feat): initial commit"
git push -uf origin main
```

## 🔧 GitHub Actions Configuration 🔧

### Permissions

Go in your repository Settings > Actions > General > Workflows permissions and check the box "Read and write permissions."
Check also the box "Allow GitHub Actions to create and approve pull requests."
