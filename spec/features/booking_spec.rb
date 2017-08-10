feature 'Bookings', js: true do
  before do
    sign_up
    log_in
    create_listing
    visit('/listings')
  end

  scenario 'Create booking', js: true do
    expect{ request_booking }.to change(Booking, :count).by(1)
    # expect(page).to have_content('Request sent to the host')
  end
end
