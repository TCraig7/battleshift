class ActivationMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail(to: @user.email, subject: "Activation Email for #{@user.email}")
  end
end
