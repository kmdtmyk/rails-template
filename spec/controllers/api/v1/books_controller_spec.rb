# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::LoginsController, type: :controller do

  describe '#create' do

    before do
      User.create(username: 'user1', password: 'pass1')
    end

    example 'success' do
      post :create, params: { username: 'user1', password: 'pass1' }
      expect(response.status).to eq 200
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:token]).not_to eq nil
    end

    example 'invalid username' do
      post :create, params: { username: 'user1', password: 'invalid' }
      expect(response.status).to eq 401
    end

    example 'invalid password' do
      post :create, params: { username: 'invalid', password: 'pass1' }
      expect(response.status).to eq 401
    end

  end

end
