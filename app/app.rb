ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'controllers/listings'

class Makersbnb < Sinatra::Base
  use Rack::MethodOverride

  enable :sessions
  set :session_secret, rand.to_s
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end

    def current_listing
      @current_listing ||= Listing.get(session[:listing_id])
    end
  end

  get '/' do
    if current_user then redirect '/listings' else redirect '/sign_up' end
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
    redirect_to_signup_if_needed
    @listing = Listing.first(id: params[:id])
    session[:listing_id] = @listing.id
    erb :'/listings/listing_page'
  end

  post '/booking/new' do
    redirect_to_signup_if_needed
    @booking = Booking.new(start_date: params[:start_date], end_date: params[:end_date], confirmed: false)
    if @booking
      @booking.user = current_user
      @booking.listing = current_listing
      @booking.save
      flash.keep[:notice] = "Request sent to the host"
      redirect('/dashboard')
    end
  end

  post '/booking/update' do
    redirect_to_signup_if_needed
    @booking = Booking.get(params[:booking_id])
    @booking.confirmed = params[:confirmed]
    @booking.save
    redirect '/dashboard'
  end

  get '/dashboard' do
    redirect_to_signup_if_needed
    @current_user = current_user
    erb :'user/dashboard'
  end

  delete '/logout' do
    session[:user_id] = nil
    flash.keep[:notice] = 'Goodbye!'
    redirect '/log_in'
  end

  def redirect_to_signup_if_needed
    if !current_user then redirect '/sign_up' end
  end

  run! if app_file == $0
end
