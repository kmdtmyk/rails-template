# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :request do

  describe '#index' do

    example do
      get books_path
      expect(response.status).to eq 200
      expect(response).to render_template :index
    end

  end

  describe '#create' do

    example 'book' do
      params = { book: { name: 'book1', price: 100, release_date: '2019-10-15' } }
      post books_path, params: params
      expect(Book.count).to eq 1
    end

    example 'reviews' do
      reviews = [{ content: 'review1' }, { content: 'review2' }, { content: 'review3' }]
      params = { book: { reviews_attributes: reviews } }
      post books_path, params: params
      expect(Book.count).to eq 1
      expect(BookReview.count).to eq 3
    end

  end

end
