#!/bin/zsh

echo 'truncating articles'
mysql -P 3307 -uroot -h 127.0.0.1 -e 'TRUNCATE TABLE demo_rails_app_development.articles'

echo 'importing...'

# regular mysql import
time mysql -P 3307 -uroot -h 127.0.0.1 demo_rails_app_development < articles.sql

echo 'truncating articles'
mysql -P 3307 -uroot -h 127.0.0.1 -e 'TRUNCATE TABLE demo_rails_app_development.articles'
echo 'creating empty table'
time mysql -P 3307 -uroot -h 127.0.0.1 demo_rails_app_development < /tmp/articles.sql
echo 'importing tab data'
time mysqlimport -P 3307 -uroot -h 127.0.0.1 demo_rails_app_development /tmp/articles.txt


#

#$> mysql db1 < t1.sql
#$> mysqlimport db1 t1.txt

# mysqlimport
# mysqlimport [options] db_name textfile1 [textfile2 ...]


# docker <