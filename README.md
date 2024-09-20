# template-uv

[Copier](https://github.com/copier-org/copier) template that allows to quickly create the arborescence of a Python project managed by [uv](https://astral.sh/blog/uv)

## 🧪 Features 🧪

- [ ] [uv](https://astral.sh/blog/uv) setup, with pre-defined `pyproject.toml`
- [ ] Documentation built with [MkDocs](https://github.com/mkdocs/mkdocs) ([Material theme](https://github.com/squidfunk/mkdocs-material))
- [ ] Pre-configured tools for code formatting, quality analysis and testing:
  - [ ] [ruff](https://github.com/charliermarsh/ruff)
- [ ] Tests run with [pytest](https://github.com/pytest-dev/pytest) and plugins, with [coverage](https://github.com/nedbat/coveragepy) support
- [ ] Cross-platform tasks with [invoke](https://www.pyinvoke.org/)
- [ ] Python 3.12 support
- [ ] Auto-generated `CHANGELOG.md` from git commits with usage of [commitizen](https://commitizen-tools.github.io/commitizen/)


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
