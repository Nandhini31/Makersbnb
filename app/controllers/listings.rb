
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
    listing = Listing.create(title: params[:title], description: params[:description], address: params[:address],
    price_per_night: params[:price_per_night])
     p listing
    listing.user = current_user
    listing.save
    p listing 
    redirect '/listings'
  end
end
