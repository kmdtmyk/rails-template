# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::LoginsController, type: :controller do

  describe '#create' do

    before do
      User.create(username: 'user1', password: 'pass1')
    end

    example 'success' do
      post :create, body: {
        username: 'user1',
        password: 'pass1',
      }.to_json, as: :json
      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq 200
      expect(result[:token]).not_to eq nil
    end

    example 'invalid username' do
      post :create, body: {
        username: 'user1',
        password: 'invalid',
      }.to_json, as: :json
      expect(response.status).to eq 401
    end

    example 'invalid password' do
      post :create, body: {
        username: 'invalid',
        password: 'pass1',
      }.to_json, as: :json
      expect(response.status).to eq 401
    end

  end

end
