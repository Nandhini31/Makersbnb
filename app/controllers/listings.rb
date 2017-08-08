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
    Listing.create(title: params[:title], description: params[:description])
    # p listing
    # listing.user = current_user
    # listing.save
    redirect '/listings'
  end
end
