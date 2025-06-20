--Run this command on QueryTool at postgfres database to create the necessary structure for dbt
-- Create role 'transform' if it doesn't exist
DO $$
BEGIN
   IF NOT EXISTS (
      SELECT 1 FROM pg_roles WHERE rolname = 'transform'
   ) THEN
      CREATE ROLE transform;
   END IF;
END
$$;

-- Create user 'dbt' if it doesn't exist, and assign to role 'transform'
DO $$
BEGIN
   IF NOT EXISTS (
      SELECT 1 FROM pg_roles WHERE rolname = 'dbt'
   ) THEN
      CREATE USER dbt
        WITH PASSWORD 'dbtPassword123'
        LOGIN
        IN ROLE transform;
   END IF;
END
$$;