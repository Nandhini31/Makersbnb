class Booking
  include DataMapper::Resource

  property :id, Serial
  property :start_date, Date
  property :end_date, Date
  property :confirmed, Boolean

  belongs_to :user
  belongs_to :listing
end
