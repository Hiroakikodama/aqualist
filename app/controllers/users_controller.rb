class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      redirect_back fallback_location: new_user_path, flash: {
        error_messages: user.errors.full_messages
      }
    end
  end

  def show
    @aquaria = Aquarium.page(params[:page])
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
