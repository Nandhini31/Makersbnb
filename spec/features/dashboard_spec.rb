feature 'Dashboard' do
  before do
    sign_up_as_a_host
    create_listing
    logout
    sign_up_as_a_guest
    logout
  end

  scenario 'Guest makes booking request' do
    log_in_as_a_guest
    request_booking
    visit('/dashboard')
    within 'ul#my_bookings' do
      expect(page).to have_content('Lovely place No.1')
    end
  end

  scenario 'Host receives booking requests' do
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

  scenario 'Host can see their listings in the dashboard' do
    log_in_as_a_host
    visit('/dashboard')
    within 'div#my_listings' do
      expect(page).to have_content('Lovely place No.1')
    end
  end

  scenario 'Host can approve booking requests' do
    log_in_as_a_guest
    request_booking
    logout
    log_in_as_a_host
    visit('/dashboard')
    click_button('Approve')
    within 'ul#my_requests' do
      expect(page).not_to have_content('Lovely place No.1')
    end
  end

  scenario 'Host can reject booking requests' do
    log_in_as_a_guest
    request_booking
    logout
    log_in_as_a_host
    visit('/dashboard')
    click_button('Reject')
    within 'ul#my_requests' do
      expect(page).not_to have_content('Lovely place No.1')
    end
  end
end
