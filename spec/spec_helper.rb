ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '../app/', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'capybara/poltergeist'
require 'phantomjs/poltergeist'
require 'web_helper'

Capybara.app = Makersbnb
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|

  config.before(:suite) do
      DatabaseCleaner.clean_with(:truncation)
      DatabaseCleaner.strategy = :transaction
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

end
