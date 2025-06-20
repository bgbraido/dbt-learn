--Run this command on QueryTool at airbnb database
-- Create RAW schema
CREATE SCHEMA IF NOT EXISTS raw;

-- Grant privileges on schema to transform role
GRANT USAGE, CREATE ON SCHEMA raw TO transform;

-- Grant privileges on existing tables
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA raw TO transform;

-- Set default privileges for future tables
ALTER DEFAULT PRIVILEGES IN SCHEMA raw
GRANT ALL ON TABLES TO transform;

-- Allow transform role to connect to the database
GRANT CONNECT ON DATABASE airbnb TO transform;