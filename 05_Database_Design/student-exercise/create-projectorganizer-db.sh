#!/bin/bash
export PGPASSWORD='postgres1'

psql -U postgres -f "./dropdb.sql" &&
createdb -U postgres projectorganizer &&
psql -U postgres -d projectorganizer -f "./projects.sql" 