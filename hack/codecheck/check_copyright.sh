#!/usr/bin/env bash

# Copyright 2022 The OpenWald Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
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
source "${OPENWALD_ROOT}/hack/lib/logger.sh"

# Init
FAIL_TOTAL=false

# Check copyright
log::tips "Check copyright of license header."
cd "${OPENWALD_ROOT}"
for file in $(git ls-files | grep -E "\.go$|\.sh$|\.py$" | grep -v "vendor/"); do
    echo -n "Copyright check: ${file} ---"
    FAIL_ONE=false
    if [[ -z $(cat ${file} | grep "Copyright [0-9]\{4\}\(-[0-9]\{4\}\)\? The OpenWald Authors") ]]; then
        FAIL_ONE=true
    fi
    if [[ "${FAIL_ONE}" = "true" ]]; then
        echo "$(tput -T xterm setaf 1)FAIL$(tput -T xterm sgr0)"
        FAIL_TOTAL=true
    else
        echo "$(tput -T xterm setaf 2)OK$(tput -T xterm sgr0)"
    fi
done

# Whenever one check fail, return false
if [[ "${FAIL_TOTAL}" = "true" ]]; then
    log::error "Check copyright failed."
    exit 1
fi
