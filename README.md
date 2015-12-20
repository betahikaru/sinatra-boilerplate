sinatra-boilerplate
====================

```shell
bundle install --path vendor/bundle
sqlite3 db/store_dev.db < sql/setup.sql
bundle exec rspec
bundle exec rackup
```
