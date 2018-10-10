require 'rails_helper'

feature 'visitor can see all users' do
  scenario 'can see all users' do
    visit '/users'

    expect(page).to have_content("Josiah Bartlet")
    expect(page).to have_content("Jon Tester")
  end
end
