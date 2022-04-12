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


########
# Init #
########
# Global parameter
ENV_DIR=$(dirname "${BASH_SOURCE-$0}")
ENV_DIR=$(cd -P "${ENV_DIR}"; pwd -P)
OPENWALD_ROOT=$(cd -P "${ENV_DIR}/../../"; pwd -P)
unset ENV_DIR


##############
# ASCII Logo #
##############
# https://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=OPENWALD
export OPENWALD_GREETING='
-----------------------------------------------------------------------
  ██████╗ ██████╗ ███████╗███╗   ██╗██╗    ██╗ █████╗ ██╗     ██████╗ 
 ██╔═══██╗██╔══██╗██╔════╝████╗  ██║██║    ██║██╔══██╗██║     ██╔══██╗
 ██║   ██║██████╔╝█████╗  ██╔██╗ ██║██║ █╗ ██║███████║██║     ██║  ██║
 ██║   ██║██╔═══╝ ██╔══╝  ██║╚██╗██║██║███╗██║██╔══██║██║     ██║  ██║
 ╚██████╔╝██║     ███████╗██║ ╚████║╚███╔███╔╝██║  ██║███████╗██████╔╝
  ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═══╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚══════╝╚═════╝ 
-----------------------------------------------------------------------
'

# https://textkool.com/en/ascii-art-generator?hl=default&vl=default&font=DOS%20Rebel&text=OPENWALD
export OPENWALD_GREETING2='
------------------------------------------------------------------------------------------------------------------
     ███████    ███████████  ██████████ ██████   █████ █████   ███   █████   █████████   █████       ██████████  
   ███░░░░░███ ░░███░░░░░███░░███░░░░░█░░██████ ░░███ ░░███   ░███  ░░███   ███░░░░░███ ░░███       ░░███░░░░███ 
  ███     ░░███ ░███    ░███ ░███  █ ░  ░███░███ ░███  ░███   ░███   ░███  ░███    ░███  ░███        ░███   ░░███
 ░███      ░███ ░██████████  ░██████    ░███░░███░███  ░███   ░███   ░███  ░███████████  ░███        ░███    ░███
 ░███      ░███ ░███░░░░░░   ░███░░█    ░███ ░░██████  ░░███  █████  ███   ░███░░░░░███  ░███        ░███    ░███
 ░░███     ███  ░███         ░███ ░   █ ░███  ░░█████   ░░░█████░█████░    ░███    ░███  ░███      █ ░███    ███ 
  ░░░███████░   █████        ██████████ █████  ░░█████    ░░███ ░░███      █████   █████ ███████████ ██████████  
    ░░░░░░░    ░░░░░        ░░░░░░░░░░ ░░░░░    ░░░░░      ░░░   ░░░      ░░░░░   ░░░░░ ░░░░░░░░░░░ ░░░░░░░░░░   
------------------------------------------------------------------------------------------------------------------
'


#############
# OS System #
#############
OS_ARCH=$(arch)


##########
# Golang #
##########
export MIN_GO_VERSION="go1.16.0"
