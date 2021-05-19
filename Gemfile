source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 6.1.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'http'
gem 'bcrypt', '~> 3.1.7'
gem 'jwt', '~> 2.1.0'
gem 'sidekiq', '~> 6.0.0'

group :development, :test do
  gem 'rspec-rails', '~> 3.8'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rb-readline'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'rails-controller-testing'
  gem 'dotenv-rails'
  gem 'timecop'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
