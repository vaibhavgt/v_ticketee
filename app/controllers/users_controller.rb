class UsersController < ApplicationController
  def new
  	@user = User.new 
  end

  def show
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		flash[:notice] = "You have signed up successfully."
  		redirect_to projects_path
  	else
  		flash[:alert] = "Try Again"
  		render :new
  	end

  end

private 
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
