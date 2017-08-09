class Listing
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, Text
  property :price, Integer
end
