#!/bin/sh

# Build OpenY development environment based on Docksal.

# Build the sourcecode.
echo 'Building OpenY source code'
composer create-project ymcatwincities/openy-project:8.1.x-dev openy --prefer-source --no-interaction --dev

# Copy over docksal files.
echo 'Copy over docksal configuration'
cp -R .docksal openy

echo 'Now you good to go. Your build is available in folder "openy". Just run "fin init" to start.'
