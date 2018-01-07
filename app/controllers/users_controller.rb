class UsersController < ApplicationController
  def new
    u = User.create(name: params[:name], alias: params[:alias], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation] )
    if u
      session[:user_id] = u.id
      redirect_to "/bright_ideas/"
    else
      flash[:errors] = ["there was a problem with your username or password"]
      session[:user_id] = nil
      redirect_to '/main'
    end
    puts "added user " + u.name
    puts " ...with id of " + u.id.to_s
  end

  def show
    @user = User.find(params[:id])
  end


end
