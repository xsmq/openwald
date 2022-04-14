#!/usr/bin/env bash

# Copyright 2022 Openwald Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -o errexit
set -o nounset
set -o pipefail

OPENWALD_ROOT=$(cd -P "$(dirname "${BASH_SOURCE-$0}")/../../"; pwd -P)
source "${OPENWALD_ROOT}/hack/lib/env.sh"
source "${OPENWALD_ROOT}/hack/lib/logger.sh"

# Print ASCII Logo
function util::hello_openwald() {
    echo -e "${OPENWALD_GREETING}"
    echo -e "${B_CYAN}Welcome to Openwald!${COLOR_OFF}"
}

# Check go version
# It requires ${MIN_GO_VERSION} or greater
function util::verify_go_version() {
    # Check if go tools exists
    if [[ -z "$(command -v go)" ]]; then
        echo "Cannot find go tool, please fix and retry."
        echo "See https://golang.google.cn/doc/install"
        exit 1
    fi
    
    # Check go version
    local go_version
    IFS=" " read -ra go_version <<< "$(GOFLAGS='' go version)"
    if [[ "${MIN_GO_VERSION}" != $(echo -e "${MIN_GO_VERSION}\n${go_version[2]}" | sort -s -t. -k 1,1 -k 2,2n -k 3,3n | head -n1) && "${go_version[2]}" != "devel" ]]; then
        echo "Detected go version: ${go_version[2]}."
        echo "Openwald requires ${MIN_GO_VERSION} or greater."
        echo "Please install ${MIN_GO_VERSION} or later."
        exit 1
    fi
}

# Install a go tool by command<go install pkg@version>
# Parameters:
#  - $1: package name, example: github.com/golangci/golangci-lint/cmd/golangci-lint
#  - $2: package version, example: v1.15.2
function util::go_install_tool() {
    local package="${1}@{2}"
    log::tips "Go install ${package}"
    log::execute_cmd GO111MODULE=on go install "${package}"
    local gopath=$(go env GOPATH | awk -F ':' '{print $1}')
    export PATH=${gopath}/bin:${PATH}
}
