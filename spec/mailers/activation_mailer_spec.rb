require "rails_helper"

RSpec.describe ActivationMailer, type: :mailer do
  describe "activate user account" do
    it "renders the response headers" do
			user = create(:user)
      mail = ActivationMailer.account_activation(user)
       expect(mail.subject).to eq("Activation Email for #{user.email}")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["no-reply@example.com"])
    end
     it "renders the response body" do
			user = create(:user)
			mail = ActivationMailer.account_activation(user)
       expect(mail.body.encoded).to have_content("Click here to activate your account:")
      expect(mail.body.encoded).to have_content("API key")
     end
   end
end
