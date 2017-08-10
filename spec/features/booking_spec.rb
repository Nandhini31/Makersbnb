feature 'Bookings' do
  before do
    sign_up
    log_in
    create_listing
    visit('/listings')
  end

  scenario 'Create booking' do
    expect{ request_booking }.to change(Booking, :count).by(1)
    # expect(page).to have_content('Request sent to the host')
  end
end
