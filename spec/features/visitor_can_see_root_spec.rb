require 'rails_helper'

feature 'Visitor visits root path' do
  scenario 'sees link to register' do
    VCR.use_cassette("root_path") do
      name = "Topenga R. Lawrence"
      email = "trl@example.com"
      password = 'password'

      visit '/'

      click_on "Register"

      expect(current_path).to eq(register_path)

      expect(page).to have_content("Enter Registration Details")

      fill_in :name, with: name
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password

      click_on "Submit"

      expect(current_path).to eq(dashboard_path)

      expect(page).to have_content("Logged in as #{name}")
      expect(page).to have_content("This account has not yet been activated. Please check your email.")
    end
  end
end
# As a guest user
# When I visit "/"
# And I click "Register"
# Then I should be on "/register"
# And when I fill in an email address (required)
# And I fill in name (required)
# And I fill in password and password confirmation (required)
# And I click submit
# Then I should be redirected to "/dashboard"
# And I should see a message that says "Logged in as <SOME_NAME>"
# And I should see "This account has not yet been activated. Please check your email."