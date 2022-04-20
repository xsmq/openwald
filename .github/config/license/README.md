# License Finder
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
To tell license_finder that any package with the MIT license should be approved, run: 
```shell
license_finder permitted_licenses add 'MIT' --decisions_file .github/config/license/dependency_decisions.yml
```

Apache 2.0: 
```shell
license_finder permitted_licenses add 'Apache 2.0' --decisions_file .github/config/license/dependency_decisions.yml
```

New BSD: 
```shell
license_finder permitted_licenses add 'New BSD' --decisions_file .github/config/license/dependency_decisions.yml
```

Mozilla Public License 2.0: 
```shell
license_finder permitted_licenses add 'Mozilla Public License 2.0' --decisions_file .github/config/license/dependency_decisions.yml
```


# License Header
CI tools for check license headers rely on https://github.com/apache/skywalking-eyes

## Requirements
Go 1.16 or above.

## Installation

```shell
go install github.com/apache/skywalking-eyes/cmd/license-eye@latest
```

## Usage

### Check License Header
```shell
license-eye -c .github/config/license/.licenserc.yml header check
```

### Fix License Header
 ```shell
license-eye -c .github/config/license/.licenserc.yml header fix
```
