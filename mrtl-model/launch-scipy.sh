#!/bin/sh
BASEDIR=${BASEDIR:-$(dirname $(cd $(dirname ${BASH_SOURCE[0]}) && pwd))}
set -a  # mark all variables below as exported (environment) variables

# Indentify this script as source of job configuration
K8S_CONFIG_SOURCE=${BASH_SOURCE[0]}

K8S_NUM_GPU=2  # max of 2 (contact ETS to raise limit)
K8S_NUM_CPU=8  # max of 8 ("")
K8S_GB_MEM=64  # max of 64 ("")
K8S_PRIORITY_CLASS_NAME=normal
K8S_TIMEOUT_SECONDS=43200
K8S_BYPASS_TIMEOUT_LIMIT=yes

# Controls whether an interactive Bash shell is started
SPAWN_INTERACTIVE_SHELL=YES

# Sets up proxy URL for Jupyter notebook inside
PROXY_ENABLED=YES
#K8S_ENTRYPOINT="/bin/sleep"
#K8S_ENTRYPOINT_ARGS_EXPANDED='"8640000"'

K8S_DOCKER_IMAGE="ucsdets/scipy-ml-notebook:2022.1-stable"

exec ${BASEDIR}/bin/launch.sh "$@"

