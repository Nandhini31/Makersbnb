feature 'Login' do
  # scenario 'I can log in as an existing user' do
  #   sign_up
  #   log_in
  #   expect(page).to have_current_path '/listings'
  #   expect(page).to have_content('Log o')
  # end

  scenario 'I cannot log in incorrect credentials' do
    log_in(email:'user@yahoo.com', password:'wrong')
    expect(page).to have_current_path '/log_in'
    expect(page).to have_content('The email or password is incorrect')
  end

end
