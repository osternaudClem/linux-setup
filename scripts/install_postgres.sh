#!/bin/bash
set -e

echo "Installing PostgreSQL..."
sudo apt update
sudo apt install -y postgresql postgresql-contrib

echo "Creating PostgreSQL user..."
sudo -u postgres createuser --interactive

echo "Enter the name of the user you just created:"
read pg_user

echo "Enter a password for $pg_user:"
read -s pg_password

echo "Setting password for $pg_user..."
sudo -u postgres psql -c "ALTER ROLE $pg_user WITH PASSWORD '$pg_password';"

echo "PostgreSQL setup complete."
