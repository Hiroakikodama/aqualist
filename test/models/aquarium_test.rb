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
require 'test_helper'

class AquariumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
