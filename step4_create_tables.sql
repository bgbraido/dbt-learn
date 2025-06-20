-- Connect to the airbnb database and set the schema
SET search_path TO raw;

-- Create the three tables
CREATE TABLE IF NOT EXISTS raw_listings (
    id integer,
    listing_url text,
    name text,
    room_type text,
    minimum_nights integer,
    host_id integer,
    price text,
    created_at timestamp,
    updated_at timestamp
);

CREATE TABLE IF NOT EXISTS raw_reviews (
    listing_id integer,
    date timestamp,
    reviewer_name text,
    comments text,
    sentiment text
);

CREATE TABLE IF NOT EXISTS raw_hosts (
    id integer,
    name text,
    is_superhost text,
    created_at timestamp,
    updated_at timestamp
);

-- Import data from local CSV files (adjust file paths as needed)
-- These commands must be run by a superuser or a user with the right privileges
-- and the files must be accessible to the PostgreSQL server

-- \COPY is for psql client; COPY is for server-side
-- Example using \COPY (run in psql, adjust paths):

-- \COPY raw.raw_listings (id, listing_url, name, room_type, minimum_nights, host_id, price, created_at, updated_at) FROM '/path/to/listings.csv' WITH (FORMAT csv, HEADER true)
-- \COPY raw.raw_reviews (listing_id, date, reviewer_name, comments, sentiment) FROM '/path/to/reviews.csv' WITH (FORMAT csv, HEADER true)
-- \COPY raw.raw_hosts (id, name, is_superhost, created_at, updated_at) FROM '/path/to/hosts.csv' WITH (FORMAT csv, HEADER true)