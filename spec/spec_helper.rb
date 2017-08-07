require 'capybara'
require 'capybara/rspec'
require './app/app'

require File.join(File.dirname(__FILE__), '../app/', 'app.rb')

Capybara.app = Makersbnb

RSpec.configure do |config|
end
