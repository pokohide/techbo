source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'

# Server
gem 'puma', '~> 3.0'

# Frontend
gem 'gon'
gem 'kaminari'
gem 'slim-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'coffee-rails', '~> 4.2'
gem 'acts-as-taggable-on', '~> 4.0'
gem 'uglifier', '>= 1.3.0'
gem 'sass-rails', '~> 5.0'
gem 'semantic-ui-sass', github: 'doabit/semantic-ui-sass'

# Markdown
gem 'redcarpet'
gem 'coderay'
gem 'diffy'

# Image
gem "paperclip", "~> 5.0.0"
gem 'aws-sdk', '~> 2'

# ENV
gem 'dotenv-rails'

# User
gem 'devise'
gem 'counter_culture'
gem 'social-share-button'

# API
gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 3.0'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'sqlite3'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-byebug'
  gem 'pry-stack_explorer'
  gem 'rails-erd'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'bullet'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
