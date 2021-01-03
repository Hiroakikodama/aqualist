class AddAquariumImageToAquaria < ActiveRecord::Migration[5.2]
  def change
    add_column :aquaria, :aquarium_img, :string
  end
end
