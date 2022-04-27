# Codespell
CI tools for checking misspelled words rely on https://github.com/codespell-project/codespell

## Requirements
Python 3.6 or above.

## Installation

```shell
pip install codespell==2.1.0
```

## Usage

```shell
codespell -q 7 -f -S ".git" -I .github/config/codespell/.codespellignore
```
