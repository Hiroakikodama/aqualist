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
require 'rails_helper'

RSpec.describe 'Aquariumモデルのテスト', type: :model do
  describe "バリデーションテスト" do
    context "nameカラム" do
      it "空白ではない" do
        @aquarium = Aquarium.new(name: nil)
        @aquarium.valid?
        expect(@aquarium.valid?).to eq(false)
      end
    end
    context "introductionカラム" do
      it "空白ではない" do
        @aquarium = Aquarium.new(introduction: nil)
        @aquarium.valid?
        expect(@aquarium.valid?).to eq(false)
      end
    end
    context "addressカラム" do
      it "空白ではない" do
        @aquarium = Aquarium.new(address: nil)
        @aquarium.valid?
        expect(@aquarium.valid?).to eq(false)
      end
    end
    context "officialカラム" do
      it "空白ではない" do
        @aquarium = Aquarium.new(official: nil)
        @aquarium.valid?
        expect(@aquarium.valid?).to eq(false)
      end
    end
  end

end
