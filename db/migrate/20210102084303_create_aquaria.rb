class CreateAquaria < ActiveRecord::Migration[5.2]
  def change
    create_table :aquaria do |t|
      t.string :name
      t.text :introduction
      t.text :address
      t.text :official

      t.timestamps
    end
  end
end
