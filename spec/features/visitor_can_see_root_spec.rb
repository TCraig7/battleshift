require 'rails_helper'

feature 'Visitor visits root path' do
  scenario 'sees link to register' do
    name = "Topenga R. Lawrence"
    email = "trl@example.com"
    password = 'password'
    
    VCR.use_cassette("root_path") do
      visit '/'
    end
      click_on "Register"

      expect(current_path).to eq(register_path)

      expect(page).to have_content("Enter Registration Details")

      fill_in :name, with: name
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password

    VCR.use_cassette("dashboard_path") do
      click_on "Submit"
    end
      expect(current_path).to eq(dashboard_path)

      expect(page).to have_content("Logged in as #{name}")
      expect(page).to have_content("This account has not yet been activated. Please check your email.")
  end
end
