feature 'Bookings' do
  before(:each) do
    sign_up
    log_in
    create_listing
  end

  scenario 'Create booking' do
    visit('/listings')
    click_on('Lovely place No.1')
    fill_in('start date', with: '12/01/2018')
    fill_in('end date', with: '15/01/2018')
    click_button('Request booking')
    expect(page).to have_content('Request sent to the host')
  end
end
