class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by_email(params[:id])
    user.activate_account
    flash[:success] = "Account activated!"
  end
end
