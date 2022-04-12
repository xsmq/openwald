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


function openwald::util::version_gt() {
    test "$(echo "$@" | tr " " "\n" | sort -V | head -n 1)" != "$1"
}

function openwald::util::check_go_version() {
    local min_version=$(echo ${MIN_GO_VERSION} | awk -F'go' '{print $2}')
    local go_version=$(go version | awk '{print $3}' | awk -F'go' '{print $2}')
    if openwald::util::version_gt ${min_version} ${go_version}; then
        echo "Detected go version: go${go_version}."
        echo "Openwald requires go${min_version} or greater."
        echo "Please install go${min_version} or later."
        exit 1
    fi
}
