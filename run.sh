#!/bin/bash

# Ensure a filename is provided
if [ -z "$1" ]; then
  echo "Usage: ./run.sh <filename>"
  exit 1
fi

FILENAME="$1"

# Run the Rake task to process the file
echo "Running Rake task to process file: $FILENAME..."
bundle exec rake process_file["$FILENAME"]

# Start the Rails server in the foreground
echo "Starting Rails server..."
bundle exec rails server
