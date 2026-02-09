## PostgreSQL Initialization Behavior

### How init.sql Works

**First startup (volume empty):**
- PostgreSQL entrypoint detects empty `/var/lib/postgresql/data`
- Runs `initdb` to create default database cluster
- Executes all scripts in `/docker-entrypoint-initdb.d/`
- Our `init.sql` creates needed databases
- Data persists in named volume `postgres-data`

**Subsequent startups (volume has data):**
- PostgreSQL entrypoint detects existing data directory
- Skips initialization scripts
- Starts PostgreSQL normally with existing databases

### Adding New Databases Mid-Project

**Scenario:** Week 5, need to add `analyticsdb`

**Quick fix (manual):**
```bash
docker compose exec postgres psql -U gighub <<-EOSQL
    CREATE DATABASE analyticsdb;
    CREATE USER analyticsservice WITH PASSWORD 'dev_password_123';
    GRANT ALL PRIVILEGES ON DATABASE analyticsdb TO analyticsservice;
EOSQL
```

**Proper fix (reproducible for team):**
1. Edit `infrastructure/docker/init.sql` to add new database
2. Run `docker compose down -v` (⚠️ deletes local data)
3. Run `docker compose up -d` (re-runs init.sql)
4. Commit updated init.sql

### Common Mistakes

**Editing init.sql and expecting changes to apply**
```bash
# Edit init.sql to add new database
docker compose restart postgres
# Changes not applied! Volume already exists
```

**Correct approach:**
```bash
docker compose down -v  # Delete volume
docker compose up -d    # Re-run init script
```