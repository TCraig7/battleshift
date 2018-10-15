class AccountActivationsController < ApplicationController

  def show
    user = User.find(params[:id])

    if user.activation_digest == params[:key]
      user.activate_account
      flash[:success] = "Account activated!"
      redirect_to dashboard_path(user)
    else
      flash[:danger] = "Invalid. Maybe Google knows?"
      redirect_to "http://google.com"
    end
  end
end
