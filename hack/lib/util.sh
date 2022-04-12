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

function util::verify_go_version () {
    local go_version
    IFS=" " read -ra go_version <<< "$(GOFLAGS='' go version)"
    if [[ "${MIN_GO_VERSION}" != $(echo -e "${MIN_GO_VERSION}\n${go_version[2]}" | sort -s -t. -k 1,1 -k 2,2n -k 3,3n | head -n1) && "${go_version[2]}" != "devel" ]]; then
        echo "Detected go version: ${go_version[2]}."
        echo "Openwald requires ${MIN_GO_VERSION} or greater."
        echo "Please install ${MIN_GO_VERSION} or later."
        exit 1
    fi
}

