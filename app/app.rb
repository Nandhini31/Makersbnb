require 'sinatra/base'


class Makersbnb < Sinatra::Base

  get '/sign_up' do
    erb(:sign_up)
  end

  get '/listings' do
    erb :'/listings/index'
  end

  get '/listings/new' do
    erb :'/listings/new'
  end

  post '/listings/new' do
    redirect '/listings'
  end

  run! if app_file == $0
end
