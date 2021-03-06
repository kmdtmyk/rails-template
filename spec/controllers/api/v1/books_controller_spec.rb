# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do

  describe '#create' do

    example 'create record' do
      post :create, body: {
        books: [
          {
            name: 'book1',
            price: 100,
            release_date: '2019-10-15',
            foo: 123,
          },
        ],
      }.to_json, as: :json
      expect(response.status).to eq 200
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a Array
      expect(Book.count).to eq 1
    end

    example 'lower camel case' do
      post :create, body: {
        books: [
          {
            name: 'book1',
            price: 100,
            releaseDate: '2019-10-15',
            foo: 123,
          },
        ],
      }.to_json, as: :json
      expect(response.status).to eq 200
      body = JSON.parse(response.body, symbolize_names: true)

      book = Book.last
      expect(Book.count).to eq 1
      expect(book.release_date).to eq '2019-10-15'.to_date
    end

    example 'nested attributes' do
      post :create, body: {
        books: [
          {
            name: 'book1',
            price: 100,
            release_date: '2019-10-15',
            reviews: [
              { content: 'review1' },
            ],
          },
        ],
      }.to_json, as: :json
      expect(response.status).to eq 200
      body = JSON.parse(response.body, symbolize_names: true)

      book_review = BookReview.last
      expect(BookReview.count).to eq 1
      expect(book_review.content).to eq 'review1'
    end

  end

  describe '#update' do

    example 'update attributes' do
      book = Book.create(name: 'book1', price: 100, release_date: '2019-10-15')
      patch :update, params: { id: book.id }, body: {
        book: {
          id: book.id,
          name: 'book2',
          price: 200,
          release_date: '2019-10-20',
          foo: 123,
        }
      }.to_json, as: :json
      book.reload
      expect(book.name).to eq 'book2'
      expect(book.price).to eq 200
      expect(book.release_date).to eq Date.new(2019, 10, 20)
    end

    example 'nested attributes' do
      book = Book.create
      review1 = book.reviews.create(content: '1')
      review2 = book.reviews.create(content: '2')
      review3 = book.reviews.create(content: '3')
      patch :update, params: { id: book.id }, body: {
        book: {
          id: book.id,
          reviews: [
            { id: review1.id, content: '11' },
            { id: review2.id, _destroy: true },
            { content: 'new review' },
          ]
        }
      }.to_json, as: :json
      book.reload
      review1.reload
      expect(book.reviews.count).to eq 2
      expect(book.reviews.last.content).to eq 'new review'
      expect(review1.content).to eq '11'
      expect(BookReview.find_by(id: review2.id)).to eq nil
      expect(BookReview.find_by(id: review3.id)).to eq nil
    end

  end

end
