class WelcomeController < ApplicationController
  def index; end

  def show
    @user = User.find_by(id: session[:id])
  end
end
