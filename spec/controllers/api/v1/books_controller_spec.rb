# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do

  describe '#create' do

    example 'json' do
      body = { name: 'book1', price: 100, release_date: '2019-10-15' }.to_json
      post :create, body: body
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to be_a Hash
      expect(Book.count).to eq 1
    end

    example 'array' do
      body = [
        { name: 'book1', price: 100, release_date: '2019-10-15' },
        { name: 'book2', price: 200, release_date: '2019-10-16' },
      ].to_json
      post :create, body: body
      expect(JSON.parse(response.body)).to be_a Array
      expect(response.status).to eq 200
      expect(Book.count).to eq 2
    end

    example 'lower camel case' do
      body = { releaseDate: '2019-10-15' }.to_json
      post :create, body: body
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:release_date]).to eq '2019-10-15'
    end

    example 'upper camel case' do
      body = { ReleaseDate: '2019-10-15' }.to_json
      post :create, body: body
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:release_date]).to eq '2019-10-15'
    end

  end

end
