ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'controllers/listings'

class Makersbnb < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    p params
    User.create(email: params[:email], first_name: params[:first_name],
     surname: params[:surname], password: params[:password])
    redirect '/listings'
  end


  run! if app_file == $0
end
