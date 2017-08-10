def create_listing
  visit('/listings/new')
  fill_in 'title', with: 'Lovely place No.1'
  fill_in 'description', with: 'Nice and charming place to stay'
  fill_in 'price', with: 50
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


def log_in(email: 'user@yahoo.com', password: 'password')
  visit '/log_in'
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Log in')
end

def request_booking
  click_on('Lovely place No.1')
  fill_in('start date', with: '08/07/2017')
  fill_in('end date', with: '11/07/2017')
  click_button('Request booking')
end
