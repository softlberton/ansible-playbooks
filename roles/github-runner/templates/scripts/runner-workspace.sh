#!/usr/bin/env bash

set -euo pipefail

WORKFLOW_DIR="/home/ec2-user/actions-runner/_work/"

function workflow_rm_dir() {
  # Check if the workflow directory exists.
  if [ -d "$WORKFLOW_DIR" ]; then
    # Check if the directory is empty, if directory is empty, print massage and exit.
    if [ -z "$(ls -A $WORKFLOW_DIR)" ]; then
      echo "Github Actions workflow directory exists and is empty!"
      exit 0
    # If the directory is not empty, delete directory.
    else
      echo "Github Actions workflow directory exists and is not empty!"
      echo "Cleaning up the Github Actions workflow directory ..."
      rm -rf "${WORKFLOW_DIR:?}"*
      exit 0
    fi
  # If the directory does not exist, print the message and exit.
  else
    echo "Github Actions workflow directory not exist!"
    exit 0
  fi
}

workflow_rm_dir
