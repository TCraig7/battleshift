require 'rails_helper'

feature 'visitor can see a user' do
  scenario 'can see a user' do
    VCR.use_cassette("user_show") do
      visit '/users/1'

      expect(page).to have_content("Josiah Bartlet")
    end
  end
end
