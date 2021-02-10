class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      if user.administrator == true
        redirect_to administrator_user_path(user)
      else
        redirect_to user_path(user)
      end
    else
      render 'home/index'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to aquaria_path
  end
end
