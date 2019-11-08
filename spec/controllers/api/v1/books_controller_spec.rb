# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do

  describe '#create' do

    example do
      post :create, params: { name: 'book1', price: '100', release_date: '2019-10-15' }
      expect(response.status).to eq 200
      expect(Book.count).to eq 1
    end

  end

end
