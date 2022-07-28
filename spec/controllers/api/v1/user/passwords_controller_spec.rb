# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::User::PasswordsController, type: :request do

  describe 'PATCH /api/v1/user/password' do

    context '認証あり' do

      let(:user){ create(:user) }
      let(:headers) do
        {
          'Content-Type': 'application/json',
          'Authorization': "Bearer #{user.create_auth_token}",
        }
      end

      example 'パスワード変更成功', autodoc: true do
        patch api_v1_user_password_path, params: {
          password: 'new_password'
        }.to_json, headers: headers
        result = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq 200
        expect(result[:token]).not_to eq nil
        expect(result[:message]).to eq 'パスワードの変更に成功しました'
      end

      example 'エラーが発生した場合', autodoc: true do
        patch api_v1_user_password_path, params: {
          password: 'a'
        }.to_json, headers: headers
        result = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq 422
        expect(result[:token]).to eq nil
        expect(result[:message]).to eq nil
        expect(result[:errors]).not_to eq nil
      end

    end

    context '認証なし' do

      example '認証エラー' do
        patch api_v1_user_password_path, params: {
          password: 'a'
        }.to_json
        body = JSON.parse(response.body, symbolize_names: true)
        expect(response.status).to eq 401
        expect(body[:message]).to eq 'Authentication failed'
      end

    end

  end

end
