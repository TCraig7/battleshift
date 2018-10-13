class UsersController < ApplicationController
  def index
    compiler = DataCompiler.new("api/v1/users")
    response = compiler.parser
    @users = response.map do |user|
      AppUser.new(user)
    end
  end

  def show
    id = params[:id]
    compiler = DataCompiler.new("api/v1/users/#{id}")
    response = compiler.parser
    @user = AppUser.new(response)
  end

  def edit
    @id = params[:id]
  end

  def update
    id = params[:id]
    compiler = DataCompiler.new("api/v1/users/#{id}")
    response = compiler.patcher(params)

    # flash[:notice] = "Successfully update #{parsed[:name]}"
    redirect_to users_path
  end

  def new
    @user = User.new
  end

  # def create
    
  # end
end
