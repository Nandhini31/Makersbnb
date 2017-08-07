def create_listing
  visit('/listings/new')
  fill_in 'title', with: 'Lovely place No.1'
  fill_in 'description', with: 'Nice and charming place to stay'
  click_button 'Submit listing'
end
