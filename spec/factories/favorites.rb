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
FactoryBot.define do
  factory :favorite do
    user { nil }
    aquarium { nil }
  end
end
