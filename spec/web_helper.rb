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
  fill_in('startDate', with: '08/07/2017')
  fill_in('endDate', with: '11/07/2017')
  click_button('Request booking')
end

def logout
  click_button('Log out')
end


# Dashboard helpers

def sign_up_as_a_host(email: 'landlord@yahoo.com', first_name: 'Landlord', surname: 'Oftherings', password: '123')
  visit '/sign_up'
  fill_in('email', with: email)
  fill_in('first_name', with: first_name )
  fill_in('surname', with: surname)
  fill_in('password', with: password)
  click_button('Sign up')
end

def log_in_as_a_host(email: 'landlord@yahoo.com', password: '123')
  visit '/log_in'
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Log in')
end

def sign_up_as_a_guest(email: 'guest@yahoo.com', first_name: 'Pope', surname: 'Benedict', password: '42')
  visit '/sign_up'
  fill_in('email', with: email)
  fill_in('first_name', with: first_name )
  fill_in('surname', with: surname)
  fill_in('password', with: password)
  click_button('Sign up')
end

def log_in_as_a_guest(email: 'guest@yahoo.com', password: '42')
  visit '/log_in'
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Log in')
end

def approve_booking
  visit('/dashboard')
  click_button('Approve')
end

def reject_booking
  visit('/dashboard')
  click_button('Reject')
end
