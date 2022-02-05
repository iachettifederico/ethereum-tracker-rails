source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.1"
gem "sqlite3", "~> 1.4.2"
gem "puma", "~> 5.6.1"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", "~> 1.10.3", require: false
gem "awesome_print", "~> 1.9.2"
gem "jbuilder", "~> 2.11.5"

group :development, :test do
  gem "debug", "~> 1.4.0", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails", "~> 5.1.0"
end

group :test do
  gem "rspec", "~> 3.10.0"
  gem "capybara", "~> 3.36.0"
  gem "webmock", "~> 3.14.0"
end
