#!/bin/bash

if [[ "$(systemctl is-active gremlind)" = "active" ]]; then
  echo "Gremlin is already running. To update the Gremlin client authentication, see the documentation at https://www.gremlin.com/docs/infrastructure-layer/authentication/"
  exit
fi

# Get the credentials
echo "Let's get this virtual machine registered with Gremlin!

Before you begin, you must have a Gremlin account. If you don't have an account, you can create a free account at http://gremlin.com/free

1. Go to https://app.gremlin.com/settings/teams and select your team. Then click \"Configuration\".

2. Enter your Team ID."

read TEAMID

echo "Great! Your Team ID is \"$TEAMID\".

3. Enter your Secret Key."

read TEAMSECRET

echo "Got it. Your Team Secret is \"$TEAMSECRET\".

I'll now initialize the Gremlin client.
For more information, see the documentation at:
https://www.gremlin.com/docs/infrastructure-layer/authentication/
"

export GREMLIN_TEAM_ID=$TEAMID
export GREMLIN_TEAM_SECRET=$TEAMSECRET

gremlin init --tag service="gremlin-playground"
