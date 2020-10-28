#!/bin/bash

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

# Export credentials as env vars
export GREMLIN_TEAM_ID=$TEAMID
export GREMLIN_TEAM_SECRET=$TEAMSECRET

# Initialize Gremlin
gremlin init --tag service="gremlin-playground"
