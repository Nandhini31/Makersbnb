def create_listing
  visit('/listings/new')
  fill_in 'title', with: 'Lovely place No.1'
  fill_in 'description', with: 'Nice and charming place to stay'
  click_button 'Submit listing'
end

def sign_up(email: 'user@yahoo.com', first_name: 'John', surname: 'Doe', password: 'password')
  visit '/sign_up'
  fill_in('email', with: email)
  fill_in('first_name', with: first_name )
  fill_in('surname', with: surname)
  fill_in('password', with: password)
  click_button('Sign up')
end
