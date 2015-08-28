source "https://rubygems.org"
ruby "2.2.2"

gem "rails", "~> 4.2.4"

gem "active_link_to"
gem "airbrake"
gem "bourbon"
gem "devise"
gem "font-awesome-sass"
gem "friendly_id"
gem "haml-rails"
gem "jquery-rails"
gem "jquery-turbolinks"
gem "kaminari"
gem "lodash-rails"
gem "neat"
gem "normalize-rails"
gem "passenger"
gem "pg"
gem "pghero"
gem "rack-timeout"
gem "react-rails"
gem "sass-rails"
gem "sidekiq"
gem "simple_form"
gem "sinatra", require: false
gem "title"
gem "turbolinks"
gem "uglifier"

group :development do
  gem "annotate"
  gem "better_errors"
  gem "binding_of_caller"
  gem "bitters", require: false
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "foreman", require: false
  gem "immigrant"
  gem "lol_dba"
  gem "mailcatcher", require: false
  gem "spring-commands-rspec"
  gem "spring"

  # Code style and linting
  gem "haml-lint", require: false
  gem "rubocop", require: false
  gem "scss_lint", require: false
end

group :development, :staging do
  gem "ffaker", require: false
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails"
end

group :test do
  gem "capybara"
  gem "coveralls", require: false
  gem "database_cleaner", require: false
  gem "factory_girl_rails"
  gem "formulaic"
  gem "poltergeist", require: false
  gem "shoulda-matchers", require: false
end

group :production, :staging do
  gem "rails_12factor"
  gem "newrelic_rpm"
end
