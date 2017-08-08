feature 'Logout' do
  scenario 'I can log out as an existing user' do
    sign_up
    log_in
    click_button('Log out')
    expect(page).to have_content 'goodbye!'
    expect(page).not_to have_content('Welcome user@yahoo.com')
  end
end
