# Codespell
CI tools for checking misspelled words rely on https://github.com/codespell-project/codespell

## Requirements
Python 3.6 or above.

## Installation

```shell
pip install codespell
```

## Usage

```shell
codespell -q 7 -f ".git" -I .github/config/codespell/.codespellignore
```
