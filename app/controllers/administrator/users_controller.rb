class Administrator::UsersController < ApplicationController
  before_action :admin_user
  def show
    @users = User.page(params[:page]).order(:id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to administrator_user_path(@current_user), flash: { notice: "「#{@user.name}」を削除しました" }
  end

  private
  def admin_user
    redirect_to(root_url) unless current_user.administrator?
  end
end
