ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'controllers/listings'

class Makersbnb < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/sign_up' do
    @user = User.create(email: params[:email], first_name: params[:first_name],
     surname: params[:surname], password: params[:password])
     session[:user_id] = @user.id
    redirect '/listings'
  end

  get '/log_in' do
    erb(:log_in)
  end

  post '/log_in' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/listings')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb(:log_in)
    end
  end

  get '/listing/:id' do
    @listing = Listing.first(id: params[:id])
    erb(:booking)
  end



  delete '/logout' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect '/log_in'
  end


  run! if app_file == $0
end
