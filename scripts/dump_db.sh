#!/bin/zsh
pwd
ls

echo 'Dumping database with multiple insert statements'
mysqldump -P 3307 -h 127.0.0.1 -uroot demo_rails_app_development articles > articles.sql

echo 'dumping database with --tab option'
docker compose exec db rm -f /tmp/articles.txt
mysqldump -P 3307 -h 127.0.0.1 -uroot --tab=/tmp demo_rails_app_development articles
docker compose cp db:tmp/articles.txt ./articles.txt
#mysqldump -P 3307 -h 127.0.0.1 -uroot --tab=/tmp demo_rails_app_development articles