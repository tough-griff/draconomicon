# Draconomicon
[![Build Status](https://img.shields.io/travis/tough-griff/draconomicon/master.svg)](https://travis-ci.org/tough-griff/draconomicon)
[![Code Coverage](https://img.shields.io/coveralls/tough-griff/draconomicon/master.svg)](https://coveralls.io/github/tough-griff/draconomicon)
[![Gemnasium](https://img.shields.io/gemnasium/tough-griff/draconomicon.svg)](https://gemnasium.com/tough-griff/draconomicon)

**Draconomicon** is an open-source, web-based character management platform
for table-top RPGs.

http://draconomiconapp.herokuapp.com

## Development
Run `bin/setup` to bootstrap the development environment.

Run `foreman start -f Procfile.dev` to run the app in development mode, with
[`mailcatcher`](http://mailcatcher.me/) catching your emails.
Visit http://localhost:1080 to see the emails sent by the app.

##### Spring
It is recommended to use the binstubbed commands under `bin/`, such as
`bin/rails`, `bin/rake`, and `bin/rspec`. This avoids the need to preface
commands with `bundle exec`, as well as using [`spring`](https://github.com/rails/spring)
to improve application speeds.

##### Direnv
Use [`direnv`](http://direnv.net/) to append `bin/` to the top of your `$PATH`!
Add the following to `.envrc` at the application root:
```
PATH_add bin
export MAILCATCHER_PORT=1025
export MAX_POOL_SIZE=1
export PORT=3000
export RACK_ENV=development
export RAILS_ENV=development
```
Now there's no need to preface every command with `bin/`.
