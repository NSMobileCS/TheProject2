class UsersController < ApplicationController
  def new
    u = User.create(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation] )
    if u
      session[:user_id] = u.id
      redirect_to "/users"
    else
      flash[:errors] = ["there was a problem with your username or password"]
      session[:user_id] = nil
      redirect_to '/main'
    end
  end

  def show
    @users = User.all
  end

  def edit
  end
end
