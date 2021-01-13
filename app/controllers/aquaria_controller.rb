class AquariaController < ApplicationController
  before_action :set_target_aquarium, only: %i[show]

  def show
  end

  def index
    @aquaria = params[:tag_id].present? ? Tag.find(params[:tag_id]).aquaria : Aquarium.all
    @aquaria = @aquaria.page(params[:page])
    @aquaria = @aquaria.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
  end

  private
  def aquarium_params
    params.require(:aquarium).permit(:name, :introduction, :address, :official, :aquarium_img, tag_ids: [])
  end

  def set_target_aquarium
    @aquarium = Aquarium.find(params[:id])
  end
end
