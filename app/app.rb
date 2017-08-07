require 'sinatra/base'

class Makersbnb < Sinatra::Base

  get '/sign_up' do
    erb(:sign_up)
  end




end
