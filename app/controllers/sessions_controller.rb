class SessionsController < ApplicationController
  skip_before_action :login_required

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to blogs_path, seccuess: "login success !"
    else
      flash.now[:danger] = "email and/or password wrong !"
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path, danger: "logout!"
  end
end
