require 'rails_helper'

feature 'visitor can see a user' do
  scenario 'can see a user' do
    visit '/users/1'

    expect(page).to have_content("Josiah Bartlet")
    expect(page).to have_content("jbartlet@example.com")
  end
end
