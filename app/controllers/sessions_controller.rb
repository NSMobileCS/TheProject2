class SessionsController < ApplicationController
  def new
    if session[:user_id]
      redirect_to '/bright_ideas/'
    end
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.try(:authenticate, params[:password])
        session[:user_id] = @user.id
        redirect_to "/bright_ideas/"
    else
        flash[:errors] = ["invalid username password combination"]
        redirect_to "/main"
    end
  end

  def destroy
    reset_session
    redirect_to "/main"
  end


end
