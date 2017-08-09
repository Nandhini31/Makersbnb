class Listing
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, Text
<<<<<<< HEAD
  # property :address, Text
=======
  property :address, Text
>>>>>>> master
  property :price_per_night, Integer

  belongs_to :user
end
