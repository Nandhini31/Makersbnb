require 'web_helper'

feature 'Listings' do
  before { create_listing }

  scenario 'View listings' do
    visit('/listings')
    within 'ul#listings' do
      expect(page).to have_content(message_body)
    end
  end
end
