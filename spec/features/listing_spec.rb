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
<<<<<<< HEAD
      # expect(page).to have_content('No 4, london street')
      # expect(page).to have_content(50)
=======
      expect(page).to have_content('No 4, london street')
      expect(page).to have_content(50)
>>>>>>> master
    end
  end
end
