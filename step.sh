#!/bin/bash

# exit if a command fails
set -e

#
# Required parameters
if [ -z "${build_gradle_file}" ] ; then
  echo " [!] Missing required input: build_gradle_file"
  exit 1
fi
if [ ! -f "${build_gradle_file}" ] ; then
  echo " [!] File doesn't exist at specified build.gradle path: ${build_gradle_file}"
  exit 1
fi

# ---------------------
# --- Configs:

echo " (i) Provided build.gradle path: ${build_gradle_file}"
echo

# ---------------------
# --- Main

VERSIONCODE=`grep 'versionCode ' ${build_gradle_file} | sed 's/ *//' | cut -d' ' -f2`
VERSIONNAME=`grep 'versionName ' ${build_gradle_file} | sed 's/ *//' | cut -d' ' -f2 | cut -d'"' -f2`

if [ -z "${VERSIONCODE}" ] ; then
  echo " [!] Could not find version code!"
  exit 1
fi

envman add --key AMI_VERSION_CODE --value "${VERSIONCODE}"
echo " (i) Version Code: ${VERSIONCODE} -> Saved to \$AMI_VERSION_CODE environment variable."

if [ -z "${VERSIONNAME}" ] ; then
  echo " [!] Could not find version name!"
  exit 1
fi

envman add --key AMI_VERSION_NAME --value "${VERSIONNAME}"
echo " (i) Version Name: ${VERSIONNAME} -> Saved to \$AMI_VERSION_NAME environment variable."
