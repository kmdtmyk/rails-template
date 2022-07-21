# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::LoginsController, type: :request do

  describe 'POST /api/v1/login' do

    before do
      User.create(username: 'user1', password: 'pass1')
    end

    let(:headers) do
      { 'Content-Type': 'application/json' }
    end

    example 'success' do
      post api_v1_login_path, params: {
        username: 'user1',
        password: 'pass1',
      }.to_json, headers: headers
      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 200
      expect(result[:token]).not_to eq nil
    end

    example 'invalid username' do
      post api_v1_login_path, params: {
        username: 'user1',
        password: 'invalid',
      }.to_json, headers: headers
      expect(response.status).to eq 401
    end

    example 'invalid password' do
      post api_v1_login_path, params: {
        username: 'invalid',
        password: 'pass1',
      }.to_json, headers: headers
      expect(response.status).to eq 401
    end

  end

end
