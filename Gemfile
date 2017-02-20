source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
# gem 'therubyracer', platforms: :ruby

# for user
gem 'devise'

# for tag
gem 'acts-as-taggable-on', '~> 4.0'

# frontend
gem 'gon'
gem 'slim-rails'
gem 'kaminari'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'

# for image
gem "paperclip", "~> 5.0.0"
gem 'aws-sdk', '~> 2'

# for env
gem 'dotenv-rails'

# markdown
gem 'redcarpet'
gem 'coderay'
gem 'diffy'

# like
gem 'counter_culture'
gem 'social-share-button'

# json
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
