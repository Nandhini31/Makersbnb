class Listing
  include DataMapper::Resource

  has n, :bookings 

  property :id, Serial
  property :title, String
  property :description, Text
  # property :address, Text
  property :price_per_night, Integer

  belongs_to :user
end
