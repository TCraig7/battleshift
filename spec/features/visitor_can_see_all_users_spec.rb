require 'rails_helper'

feature 'visitor can see all users' do
  scenario 'can see all users' do
    VCR.use_cassette("users_index") do
      visit '/users'

      expect(page).to have_content("Josiah Bartlet")
      expect(page).to have_content("Jon Tester")
    end
  end

  scenario 'can edit a user email' do
    VCR.use_cassette("users_edit_index") do
      visit '/users'

      click_on "Edit"

      expect(path).to eq("/users/1/edit")
    end
  end
end
