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
license-eye -c .github/config/license_header/.licenserc.yml header check
```

### Fix License Header
 ```shell
license-eye -c .github/config/license_header/.licenserc.yml header fix
```
