# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  aquarium_id :integer          not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_favorites_on_aquarium_id  (aquarium_id)
#  index_favorites_on_user_id      (user_id)
#
class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :aquarium

  validates_uniqueness_of :aquarium_id, scope: :user_id
end
