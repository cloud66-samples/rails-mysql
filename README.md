# README

Basic Rails/MySQL Example Application for use with https://www.cloud66.com

## Stack

| Component  | Version |
| ---------- | ------- |
| Ruby       | 4.0.6   |
| Rails      | 8.1.3   |
| MySQL      | 5.6.4+  |
| Assets     | Propshaft |
| JavaScript | Import maps + Hotwire (Turbo & Stimulus) |
| Jobs       | Sidekiq 8 (Redis) |

There is no Node.js/Yarn build step: stylesheets are served by Propshaft and
JavaScript ships as ESM import maps, so `bin/rails assets:precompile` is all
that production needs.

## Getting started

```bash
bin/setup
bin/rails server
```

`bin/setup` installs gems and runs `bin/rails db:prepare`. The database
connection is read from `config/database.yml`, which honours the `MYSQL_HOST`
(or `MYSQL_ADDRESS`), `MYSQL_PORT`, `MYSQL_USERNAME`, `MYSQL_PASSWORD` and
`MYSQL_DATABASE` environment variables that Cloud 66 injects in production.

If your MySQL server is not on the default port, point the app at it:

```bash
MYSQL_PORT=3307 bin/rails db:prepare
```

## Checks

```bash
bin/rails test   # minitest suite
bin/ci           # style, security audits and tests, as run in CI
```

`/up` returns 200 once the app boots cleanly — use it for load balancer and
uptime checks.
