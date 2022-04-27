source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1', '>= 6.1.4.7'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.3', '>= 1.3.5'
# Use Puma as the app server
gem 'puma', '5.6.4'
# Use SCSS for stylesheets
gem 'sassc-rails', '~> 2.1'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.9', '>= 2.9.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.11', '>= 1.11.1', require: false

gem 'rack-dev-mark', '~> 0.7.9'
gem 'kaminari', '~> 1.2', '>= 1.2.2'
gem 'slim', '~> 4.1'
gem 'gretel', '~> 4.4'
gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'jwt', '~> 2.2', '>= 2.2.2'
gem 'search_cop', '~> 1.2'
gem 'gon', '~> 6.4'
gem 'active_model_serializers', '~> 0.10.12'

gem 'rparam', git: 'https://github.com/kmdtmyk/rparam', ref: '687785ff5994bdec356950e25c76a7e208d2d9d4'

# gem 'google-cloud-storage', '~> 1.34', '>= 1.34.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  gem 'rspec-rails', '~> 5.1', '>= 5.1.1'
  gem 'rexml', '~> 3.2', '>= 3.2.5'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.18'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.3', '>= 2.3.2'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'binding_of_caller', '~> 1.0'
  gem 'bullet', '~> 7.0', '>= 7.0.1'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
