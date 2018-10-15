require 'rails_helper'

describe 'users api endpoints' do
  context 'PATCH /api/v1/users/:id' do
    it "allows a visitor to edit a user email" do
      user_1, user_2 = create_list(:user, 2)
      email = "jbartlet22@gmail.com"

      patch "/api/v1/users/#{user_1.id}", params: {email: email}
      expect(response.status).to be 200
      expect(User.find(user_1.id).email).to eq(email)
    end
  end
end

