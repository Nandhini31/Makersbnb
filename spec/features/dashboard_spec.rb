feature 'Dashboard' do
  before do
    sign_up_as_a_host
    create_listing
    logout
    sign_up_as_a_guest
    logout
  end

  scenario 'Host receives requests' do
    log_in_as_a_guest
    request_booking
    visit('/listings')
    logout
    log_in_as_a_host
    visit('/dashboard')
    within 'ul#my_requests' do
      expect(page).to have_content('Lovely place No.1')
    end
  end
end
