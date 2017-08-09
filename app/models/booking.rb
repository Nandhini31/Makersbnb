class Booking
  include DataMapper::Resource

  property :id, Serial
  property :confirmed, Boolean

  belongs_to :user
  belongs_to :listing
end
