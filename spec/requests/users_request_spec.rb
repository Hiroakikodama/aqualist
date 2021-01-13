require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe UsersController do
    describe "GET #index" do
      it "indexへのリクエストが成功すること" do
        get users_url
        expect(response.status).to eq 200
      end
    end
    describe "GET #show" do
      it "showへのリクエストが成功すること" do
        @user = User.new(
          name: "テストユーザー",
          password: "test12345"
        )
        get user_url テストユーザー.id
        expect(response.status).to eq 200
      end
    end
    describe "GET #new" do
      it "newへのリクエストが成功すること" do
        get new_user_url
        expect(response.status).to eq 200
      end
    end
    describe "POST #create" do
      context "パラメーターが妥当な場合" do
        it "createリクエストが成功すること" do
          post users_url, params: { user: FactoryBot.attributes_for(:user) }
          expect(response.status).to eq 302
        end
        it "ユーザーが登録されること" do
          expect do
            post users_url, params: { user: FactoryBot.attributes_for(:user) }
          end.to change(User, :count).by(1)
        end
        it "リダイレクトすること" do
          post users_url, params: { user: FactoryBot.attributes_for(:user, :invalid) }
          expect(response.status).to eq 200
        end
      end
      context "パラメータが不正な場合" do
        it "リクエストが成功すること" do
          post users_url, params: { user: FactoryBot.attributes_for(:user, :invalid) }
          expect(response.status).to eq 200
        end
        it "ユーザーが登録されないこと" do
          expect do
            post users_url, params: { user: FactoryBot.attributes_for(:user, :invalid) }
          end.to_not change(User, :count)
        end
        it "エラーが表示されること" do
          post users_url, params: { user: FactoryBot.attributes_for(:user, :invalid) }
          expect(response.body).to include 'prohibited this user from being saved'
        end
      end
    end
  end
end
