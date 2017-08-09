describe 'Booking' do
  before(:each) do
    @user = User.create(email: 'test@test.com', first_name: 'Liza', surname: 'Smith', password: '123')
    @listing = Listing.create(title: 'Buckingham Palace', description: 'Stay like the Queen', price_per_night: 9.99)
    @listing.user = @user
    @listing.save
    @booking = Booking.create(confirmed: false)
    @booking.user = @user
    @booking.listing = @listing
    @booking.save
  end

  it 'expected to be possible :-)' do
    expect(@booking.user).to eq @user
    expect(@booking.listing).to eq @listing
  end

  it 'expected to be accessible from listing' do
    expect(@listing.bookings.last).to eq @booking
  end

  it 'expected to be accessible from user' do
    expect(@user.bookings.last).to eq @booking
  end
end
