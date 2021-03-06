#!/bin/bash

set -xeo pipefail

export  LC_ALL=en_US.utf-8
env
ENV_CMD=""
if [[ $ENVIRONMENT != "" ]]
then
ENV_CMD="--env $ENVIRONMENT"
fi

if [[ $ACTION == "apply" ||  ACTION == "destroy" ]]
then
  opta $ACTION -c $CONFIG_FILE  --auto-approve $ENV_CMD $EXTRA_ARGS
else
  opta force-unlock -c $CONFIG_FILE  --auto-approve $ENV_CMD $EXTRA_ARGS
fi

