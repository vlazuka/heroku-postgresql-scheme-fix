# Heroku PostgreSQL scheme fix

SQLAlchemy doesn't support `postgres://` scheme for database connections.

https://help.heroku.com/ZKNTJQSK/why-is-sqlalchemy-1-4-x-not-connecting-to-heroku-postgres

You can’t change the heroku config; it’s set by the addon. But, you can modify the ENV var in-dyno before starting your process.

```
$ env DATABASE_URL=postgres://credential \
  bin/pg-env-fix --attachment DATABASE \
  printenv DATABASE_URL

[PGENVFIX] modifying DATABASE_URL
postgresql://credential
```

## The innards

> Write a script, call it something like launch.py (or launch.sh or whatever — depending on your language. I’m sure you could do this with sed in bash). TBH I don’t care what you call it :smile:.

This scripts job is to:
- Read in the `DATABASE_URL` env var.
- Modify it, replacing postgres with postgreql
- Re-export it, overwriting the original.
- Launch a command using all the rest of the input parameters.

Then you can modify your Procfile so it does something like this:
```
web: ./launch bundle exec puma
```
