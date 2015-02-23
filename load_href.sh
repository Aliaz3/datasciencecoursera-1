#!/bin/bash

createdb hockey

psql hockey -f create_schema_href.sql

cat href/games_*.csv >> /tmp/href_games.csv
chmod 644 /tmp/href_games.csv
psql hockey -f load_href_games.sql
rm /tmp/href_games.csv

cp href/playoffs.csv /tmp/href_playoffs.csv
chmod 644 /tmp/href_playoffs.csv
psql hockey -f load_href_playoffs.sql
rm /tmp/href_playoffs.csv

psql hockey -f create_href_teams.sql

exit 0