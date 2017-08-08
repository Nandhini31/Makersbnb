ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'controllers/listings'
require_relative './models/listing'

class Makersbnb < Sinatra::Base
  enable :sessions

  get '/sign_up' do
    erb(:sign_up)
  end

  run! if app_file == $0
end
