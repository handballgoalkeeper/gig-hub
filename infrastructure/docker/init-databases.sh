#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Create databases for each service
    CREATE DATABASE userdb;

    -- Create dedicated users for each service (principle of least privilege)
    CREATE USER userservice WITH PASSWORD 'dev_password_123';

    -- Grant permissions (each user can only access their own database)
    GRANT ALL PRIVILEGES ON DATABASE userdb TO userservice;
EOSQL

echo "All databases created successfully!"