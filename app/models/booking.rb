class Booking
  include DataMapper::Resource

  property :id, Serial
  property :start_date, String
  property :end_date, String
  property :confirmed, Boolean

  belongs_to :user
  belongs_to :listing
end
