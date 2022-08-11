#!/bin/bash
# Copyright (c) 2022 Robert Bosch GmbH and Microsoft Corporation
#
# This program and the accompanying materials are made available under the
# terms of the Apache License, Version 2.0 which is available at
# https://www.apache.org/licenses/LICENSE-2.0.
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
# License for the specific language governing permissions and limitations
# under the License.
#
# SPDX-License-Identifier: Apache-2.0

echo "#######################################################"
echo "### Running VehicleDataBroke CLI                    ###"
echo "#######################################################"

# Get Data from AppManifest.json and save to ENV
UTILS_DIRECTORY=$(dirname `cd ..; dirname "$0"`)/utils
source $UTILS_DIRECTORY/get-appmanifest-data.sh

ROOT_DIRECTORY=$( realpath "$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )/../../../.." )

if [[ `uname -m` == 'aarch64' ]]; then
    echo "Detected ARM architecture"
    PROCESSOR="aarch64"
    DATABROKER_EXEC_PATH="$ROOT_DIRECTORY/.vscode/scripts/assets/databroker/$DATABROKER_TAG/$PROCESSOR/target/aarch64-unknown-linux-gnu/release"
else
    echo "Detected x86_64 architecture"
    PROCESSOR="x86_64"
    DATABROKER_EXEC_PATH="$ROOT_DIRECTORY/.vscode/scripts/assets/databroker/$DATABROKER_TAG/$PROCESSOR/target/release"
fi

$DATABROKER_EXEC_PATH/databroker-cli
