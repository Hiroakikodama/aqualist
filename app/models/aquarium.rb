# == Schema Information
#
# Table name: aquaria
#
#  id           :integer          not null, primary key
#  address      :text
#  aquarium_img :string
#  introduction :text
#  name         :string
#  official     :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Aquarium < ApplicationRecord
  mount_uploader :aquarium_img, AquariumImgUploader
  has_many :aquarium_tag_relations, dependent: :delete_all
  has_many :tags, through: :aquarium_tag_relations


  validates :name, presence: true
  validates :introduction, presence: true
  validates :address, presence: true
  validates :official, presence: true
end
