feature 'Dashboard' do
  before { sign_up_as_a_host }
  before { create_listing }
  before { logout }
  before { sign_up_as_a_guest }
  before { logout }

  scenario 'Hosts receives requests' do
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
