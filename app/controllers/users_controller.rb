class UsersController < ApplicationController
  def new
  end

  def show
    @users = User.all
  end

  def edit
  end
end
