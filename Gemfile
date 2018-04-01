# frozen_string_literal: true
ruby File.read(File.expand_path("../.ruby-version", __FILE__)).chomp

source "https://rubygems.org"
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "rails", "5.2.0.rc2"

gem "activestorage-cloudinary-service"
gem "administrate", "~> 0.9.0"
gem "bootsnap", "~> 1.2"
gem "cloudinary", "~> 1.9", require: false
gem "devise", "~> 4.4"
gem "devise-pwned_password", github: "michaelbanfield/devise-pwned_password"
gem "jbuilder", "~> 2.7"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.7"
gem "scout_apm", "~> 2.4"
gem "tiddle", github: "adamniedzielski/tiddle"
gem "webpacker", "~> 3.2"

group :production do
  gem "lograge", "~> 0.9.0"
  gem "redis", "~> 4.0"
  gem "sendgrid-ruby", "~> 5.2"
end

group :development, :test do
  gem "pry-byebug", "~> 3.6"
  gem "pry-rails", "~> 0.3.6"
  gem "rspec-rails", "~> 3.7"
end

group :development do
  gem "guard-livereload", "~> 2.5", require: false
  gem "guard-rspec", "~> 4.7", require: false
  gem "listen", ">= 3.0.5", "< 3.2", require: false
  gem "rack-livereload", "~> 0.3.16"
  gem "web-console", "~> 3.3"
end
