class UsersController < ApplicationController
  
  def index
    @users = User.all

  end


  def new
  	@user = User.new 
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
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
