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

# Color
RED='\e[0;31m'          # Red
GREEN='\e[0;32m'        # Green
YELLOW='\e[0;33m'       # Yellow
PURPLE='\e[0;35m'       # Purple
CYAN='\e[0;36m'         # Cyan
B_RED='\e[1;31m'        # Bold Red
B_GREEN='\e[1;32m'      # Bold Green
B_YELLOW='\e[1;33m'     # Bold Yellow
B_PURPLE='\e[1;35m'     # Bold Purple
B_CYAN='\e[1;36m'       # Bold Cyan
COLOR_OFF='\e[0m'       # Text Reset


##############
# Log Module #
##############
# Tips
function log::tips() {
    local log_msg=${1}
    echo -e "\n${B_GREEN}[TIPS] ${log_msg}${COLOR_OFF}"
}

# Info msg
function log::info() {
    local log_msg=${1}
    echo -e "${GREEN}[INFO] ${log_msg}${COLOR_OFF}"
}

# Error msg
function log::error() {
    local log_msg=${1}
    echo -e "${RED}[ERROR] ${log_msg}${COLOR_OFF}"
}

# Print command
function log::print_cmd() {
   local cmd="$*"
   echo -e "${B_PURPLE}[Command]${COLOR_OFF} ${PURPLE}${cmd}${COLOR_OFF}"
}

# Print and execute command
function log::execute_cmd() {
   local cmd="$*"
   log::print_cmd "${cmd}"
   ${cmd}
}
