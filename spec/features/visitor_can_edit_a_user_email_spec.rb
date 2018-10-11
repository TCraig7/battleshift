require 'rails_helper'

feature 'visitor can see user edit page' do
  scenario 'can edit a user email' do
    VCR.use_cassette("edit_user_email") do
      visit '/users/1/edit'
    end

    email = "jbbartlet22@gmail.com"

    VCR.use_cassette("patch_email", :allow_unused_http_interactions => false) do
      fill_in :email, with: email
      click_on("Update")

      expect(current_path).to eq(users_path)
      expect(page).to have_content(email)
    end
  end
end
