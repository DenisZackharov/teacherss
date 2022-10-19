source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "devise"
gem "enumerize"
gem "importmap-rails"
gem "jbuilder"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 7.0.3", ">= 7.0.3.1"
gem "redis", "~> 4.0"
gem "sassc-rails"
gem "seedbank"
gem "sprockets-rails"
gem "stimulus-rails"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "debug", platforms: %i[mri mingw x64_mingw]
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker", git: "https://github.com/faker-ruby/faker.git", branch: "master"
  gem "rspec-rails"
  gem "rubocop", require: false
  gem "rubocop-i18n", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-rspec", require: false
  gem "rubocop-thread_safety", require: false
end

group :development do
  gem "spring"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "simplecov", require: false
  gem "webdrivers"
end
