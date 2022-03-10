class UsersController < ApplicationController
  skip_before_action :login_required, only: %i[ new create ]
  before_action :set_params, only: %i[ show destroy ]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user
      redirect_to blogs_path, success: "success signup!"
    else
      render :new
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_digest)
  end

  def set_params
    @user = User.find(params[:id])
  end
end
