def create_listing
  visit('/listings/new')
  fill_in 'title', with: 'Lovely place No.1'
  fill_in 'description', with: 'Nice and charming place for a proper holiday'
  click_button 'Submit listing'
end
