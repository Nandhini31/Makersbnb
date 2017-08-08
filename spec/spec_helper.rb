ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '../app/', 'app.rb')

require 'capybara'
require 'capybara/rspec'
# require './app/app'
require './app/models/listing'

Capybara.app = Makersbnb

RSpec.configure do |config|

end
