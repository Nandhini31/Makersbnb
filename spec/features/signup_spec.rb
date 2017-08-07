feature 'Signup' do
  scenario 'I can sign up as an new user' do
    visit '/sign_up'
    fill_in('email', with: 'user@yahoo.com')
    fill_in('first name', with: 'John')
    fill_in('surname', with: 'Doe')
    fill_in('password', with: 'password')
    click_button('Sign up')
    expect(page).to have_content('Welcome John Doe')
  end
end
