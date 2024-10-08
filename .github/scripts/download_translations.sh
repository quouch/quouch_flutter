#!/bin/bash

# Description: Downloads translations from Localazy.

# Check that .env file exists. If it exists, load it. If not, assume it's set in the environment and move on...
if [ -f .env ]
then
    set -a; source .env; set +a
else
    echo ".env file not found. Let's pretend that you have the right variables in your environment..."
fi

# If LOCALIZELY_API_TOKEN is not set, exit with instructions to set it
if [ -z "$LOCALIZELY_API_TOKEN" ]
then
    echo "LOCALIZELY_API_TOKEN is not set. Please set it in the .env file."
    exit
fi

flutter pub run intl_utils:localizely_download --api-token $LOCALIZELY_API_TOKEN
flutter gen-l10n
