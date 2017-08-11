
class Makersbnb < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')

  get '/listings' do
    @listings = Listing.all
    erb :'listings/index', layout: :layout
  end

  get '/listings/new' do
    erb :'listings/new'
  end

  post '/listings/new' do
    listing = Listing.create(title: params[:title], description: params[:description],
    price_per_night: params[:price])
    listing.user = current_user
    listing.save
    redirect '/dashboard'
  end
end
