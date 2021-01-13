class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render 'home/index'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to aquaria_path
  end
end
