# License Checker
CI tools for detect the licenses of the packages rely on https://github.com/pivotal/LicenseFinder

## Requirements
License Finder requires Ruby 2.4.0 or greater to run.

## Installation

```shell
gem install license_finder
```

## Usage

```shell
license_finder --decisions_file .github/config/license/dependency_decisions.yml
```

## Add a license

```shell
license_finder  permitted_licenses add 'MIT' --decisions_file .github/config/license/dependency_decisions.yml
license_finder  permitted_licenses add 'Apache 2.0' --decisions_file .github/config/license/dependency_decisions.yml
license_finder  permitted_licenses add 'New BSD' --decisions_file .github/config/license/dependency_decisions.yml
license_finder  permitted_licenses add 'Mozilla Public License 2.0' --decisions_file .github/config/license/dependency_decisions.yml
```
