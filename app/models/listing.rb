require 'data_mapper'
require 'dm-postgres-adapter'

class Listing
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, Text
end
