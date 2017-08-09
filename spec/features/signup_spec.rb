feature 'Signup' do
  scenario 'I can sign up as an new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_current_path '/listings'
    expect(page).to have_content('Welcome user@yahoo.com')
  end
end
