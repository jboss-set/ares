#!/bin/bash
set -eo pipefail

readonly JENKINS_NEXT_PATH=${JENKINS_NEXT_PATH:-'/jenkins.next'}
readonly JENKINS_PATH=${JENKINS_PATH:-'/jenkins'}

readonly JENKINS_HOME=${JENKINS_HOME:-'/home/jenkins'}
readonly JENKINS_NEXT_HOME=${JENKINS_NEXT_HOME:-'/tmp/jenkins'}

readonly DOCKER_FILE='Dockerfile'
readonly CASC_FILE='casc.yaml'

if [ ! -e "${DOCKER_FILE}" ]; then
  echo "No Dockerfile: ${DOCKER_FILE}, abort."
  exit 1
fi

if [ ! -e "${CASC_FILE}" ]; then
  echo "No CASC file found: ${CASC_FILE}, abort."
  exit 2
fi

sed -e "s;--prefix=${JENKINS_PATH}\";--prefix=${JENKINS_NEXT_PATH}\";" \
    -i "${DOCKER_FILE}"
sed -e "s;\(url: http.*\)${JENKINS_PATH}/;\1${JENKINS_NEXT_PATH};" \
    -e "s;\(value: \"\)${JENKINS_HOME};\1${JENKINS_NEXT_HOME};" \
    -i "${CASC_FILE}"
