class FavoritesController < ApplicationController
  before_action :set_aquarium

  def create
    favorite = current_user.favorites.new(aquarium_id: @aquarium.id)
    favorite.save
    redirect_to aquarium_path(@aquarium)
  end

  def destroy
    favorite = current_user.favorites.find_by(aquarium_id: @aquarium.id)
    favorite.destroy
    redirect_to aquarium_path(@aquarium)
  end

  private
  def set_aquarium
    @aquarium = Aquarium.find(params[:aquarium_id])
  end
end
