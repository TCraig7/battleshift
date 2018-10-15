require 'rails_helper'

feature 'Guest creates an account' do
  scenario 'successfully registers with valid fields entered' do
    visit '/'
    click_on 'Register'

    expect(current_path).to eq('/register')

    name = 'Battleshift Aficionado'

    fill_in :email, with: 'test@example.com'
    fill_in :name, with: name
    fill_in :password, with: 'password'
    fill_in :password_confirmation, with: 'password'
    click_on 'Submit'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Logged in as #{name}")
    expect(page).to have_content('This account has not yet been activated. Please check your email.')
  end

  scenario 'unsuccessfully creates with required fields not entered' do
    visit '/register'

    fill_in :email, with: ''
    fill_in :name, with: ''
    fill_in :password, with: ''
    fill_in :password_confirmation, with: ''
    click_on 'Submit'

    expect(current_path).to eq('/register')
    expect(page).to have_content('Invalid registration details.')
  end
end