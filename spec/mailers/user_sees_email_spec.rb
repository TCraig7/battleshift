require "rails_helper"

RSpec.describe UserNotifier, type: :mailer do
  describe "activate user account" do
    it "renders the response headers" do
			user = create(:user)
      mail = UserNotifier.activate(user)

      expect(mail.subject).to eq("Confirm Your Account")
      expect(mail.to).to eq(["jtester@example.com"])
      expect(mail.from).to eq(["no-reply@example.com"])
    end

    it "renders the response body" do
			user = create(:user)
			mail = UserNotifier.activate(user)

      expect(mail.body.encoded).to have_content("Click here to activate your account")
      expect(mail.body.encoded).to have_content("API Key: ")
     end
   end
end
