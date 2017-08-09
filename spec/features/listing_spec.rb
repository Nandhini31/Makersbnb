feature 'Listings' do
  before(:each) do
    sign_up
    log_in
    create_listing
  end

  scenario 'View listings' do
    visit('/listings')
    within 'ul#listings' do
      expect(page).to have_content('Nice and charming place to stay')
      # expect(page).to have_content('No 4, london street')
      # expect(page).to have_content(50)
    end
  end

  scenario 'view one listing' do
    visit('/listings')
    click_on('Lovely place No.1')
    expect(page).to have_content('Lovely place No.1')
    expect(page).to have_content('Nice and charming place to stay')
    expect(page).to have_content(50)
  end
end
