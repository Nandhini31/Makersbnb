ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './models/listing'

class Makersbnb < Sinatra::Base
  get '/sign_up' do
    erb(:sign_up)
  end

  get '/listings' do
    @listings = Listing.all
    erb :'/listings/index'
  end

  get '/listings/new' do
    erb :'/listings/new'
  end

  post '/listings/new' do
    Listing.create(title: params[:title], description: params[:description])
    # p listing
    # listing.user = current_user
    # listing.save
    redirect '/listings'
  end

  run! if app_file == $0
end
