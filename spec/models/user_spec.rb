# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  administrator   :boolean          default(FALSE)
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe "バリデーションテスト" do
    context "nameカラム" do
      it "空白ではない" do
        @user = User.new(name: nil)
        @user.valid?
        expect(@user.valid?).to eq(false)
      end

      it "重複していない" do
        User.create(
          name: "テストユーザー",
          password: "test1234"
        )
        @user = User.new(
          name: "テストユーザー",
          password: "test1234"
        )
        @user.valid?
        expect(@user.valid?).to eq(false)
      end

      it "16文字以下である" do
        @user = User.new(
          name: "testuser123456789",
          password: "test1234"
        )
        @user.valid?
        expect(@user.valid?).to eq(false)
      end
    end

    context "passwordカラム" do
      it "8文字以上である" do
        @user = User.new(
          name: "test",
          password: "testuse"
        )
        @user.valid?
        expect(@user.valid?).to eq(false)
      end
    end
  end
end
