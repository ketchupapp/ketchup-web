# frozen_string_literal: true
ruby File.read(File.expand_path("../.ruby-version", __FILE__)).chomp

source "https://rubygems.org"
git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem "rails", "5.1.5"

gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 3.7"
gem "webpacker", "~> 3.2"

group :production do
  gem "redis", "~> 4.0"
end

group :development, :test do
  gem "pry-byebug", "~> 3.6"
  gem "rspec-rails", "~> 3.7"
end

group :development do
  gem "web-console", "~> 3.3"
  gem "listen", ">= 3.0.5", "< 3.2"
end
