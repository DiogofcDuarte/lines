#!/bin/bash

set -e  # Exit if any command fails

echo "This build assumes brew is installed"

echo "Installing required dependencies..."

# Install rbenv (for Ruby version management) if not installed
if ! command -v rbenv &> /dev/null; then
  echo "Installing rbenv..."
  brew install rbenv ruby-build
  eval "$(rbenv init -)"
fi

# Install Ruby 3.2.0 using rbenv
if ! ruby -v | grep -q "3.2.0"; then
  echo "Installing Ruby 3.2.0..."
  rbenv install -s 3.2.0
  rbenv global 3.2.0
fi


echo "Installing latest Bundler..."
gem install bundler


# Install Rails 8.0.2
if ! gem list rails -i -v 8.0.2 > /dev/null; then
  echo "Installing Rails 8.0.2..."
  gem install rails -v 8.0.2
fi

# Install project dependencies
echo "Installing Rails dependencies..."
bundle install

echo "Setup complete! You can now run the application using ./run.sh"
