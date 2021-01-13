class Administrator::AquariaController < ApplicationController
  before_action :admin_user
  before_action :set_target_aquarium, only: %i[show edit update destroy]
  def new
    @aquarium = Aquarium.new
  end

  def create
    aquarium = Aquarium.new(aquarium_params)
    if aquarium.save
      flash[:notice] = "「#{aquarium.name}」を作成しました"
      redirect_to administrator_aquarium_path(aquarium.id)
    else
      redirect_to new_administrator_aquarium_path, flash: {
        error_messages: aquarium.errors.full_messages
      }
    end
  end

  def edit
  end

  def update
    if @aquarium.update(aquarium_params)
      redirect_to administrator_aquarium_path(@aquarium.id)
    else
      redirect_back fallback_location: @aquarium, flash: {
        error_messages: @aquarium.errors.full_messages
      }
    end
  end

  def show
  end

  def index
    @aquaria = params[:tag_id].present? ? Tag.find(params[:tag_id]).aquaria : Aquarium.all
    @aquaria = @aquaria.page(params[:page])
    @aquaria = @aquaria.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  def destroy
    @aquarium.destroy
    redirect_to administrator_aquaria_path, flash: { notice: "「#{@aquarium.name}」を削除しました" }
  end

  private
  def aquarium_params
    params.require(:aquarium).permit(:name, :introduction, :address, :official, :aquarium_img, tag_ids: [])
  end

  def set_target_aquarium
    @aquarium = Aquarium.find(params[:id])
  end

  def admin_user
    redirect_to(root_url) unless current_user.administrator?
  end
end
