class IdeasController < ApplicationController
  def index
    user = User.find(session[:user_id])
    if user
      @ideas = Idea.all
    else
      redirect_to '/main/'
    end
  end

  def create
    user = User.find(session[:user_id])
    if user
      idea = Idea.create(user: user, content: params[:content])
      redirect_to '/bright_ideas/'
    else
      flash[:errors] = ["idea create error!! (...are you sure that it is a good idea?)"]
      redirect_to '/main/'
    end
  end

  def like
    user = User.find(session[:user_id])
    idea = Idea.find(params[:id])
    if (user && idea)
      like = Like.create(user: user, idea: idea)
      redirect_to '/bright_ideas/'
    else
      flash[:errors] = ['like create error -- are you sure you are logged in?']
      redirect_to '/main/'
    end
  end

  def show
    user = User.find(session[:user_id])
    if user
      @idea = Idea.find(params[:id])
    else
      redirect_to '/main/'
    end
  end


  def destroy
    user = User.find(session[:user_id])
    idea = Idea.find(params[:id])
    if (user) && (idea) && (user == idea.user)
      idea.destroy
    end
    redirect_to '/bright_ideas/'
  end

end
