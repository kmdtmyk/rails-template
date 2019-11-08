# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::LoginsController, type: :controller do

  describe '#create' do

    before do
      User.create(username: 'user1', password: 'pass1')
    end

    example 'success' do
      body = { username: 'user1', password: 'pass1' }.to_json
      post :create, body: body
      expect(response.status).to eq 200
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:token]).not_to eq nil
    end

    example 'invalid username' do
      body = { username: 'user1', password: 'invalid' }.to_json
      post :create, body: body
      expect(response.status).to eq 401
    end

    example 'invalid password' do
      body = { username: 'invalid', password: 'pass1' }.to_json
      post :create, body: body
      expect(response.status).to eq 401
    end

  end

end
