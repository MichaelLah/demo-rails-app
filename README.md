# README

This is a demo Rails 7.0 application used to demo certain features or test cool functionality.

# Setup

```shell
bundle install
rails db:reset
```

Start the server:
```shell
rails s
```

# Demos

## Database

### Clustered index key size performance

Reducing the size of an index key can lead to performance improvements.

This demo shows the performance difference between a primary key that is a `VARCHAR(36)` vs `VARCHAR(255)`

Test this by seeding your database with a bunch of `articles` and `fast_articles`

```ruby
ArticleFactory.new.generate(1_000_000)
FastArticleFactory.new.generate(1_000_000)
```

`articles` have an `id` column which is `VARCHAR(255)`
`fast_articles` have an `id` which is `VARCHAR(36)`

Try the following queries and note the performance difference for each one

```mysql
SELECT COUNT(*) FROM articles;
SELECT COUNT(*) FROM fast_articles
```

View these articles here:

http://0.0.0.0:3300/articles

http://0.0.0.0:3300/fast_articles



### B+ vs. Hash indexes
Coming Soon

### Covering Indexes
Coming soon