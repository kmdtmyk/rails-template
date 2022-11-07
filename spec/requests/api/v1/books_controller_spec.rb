# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :request do

  let(:headers) do
    {
      'Content-Type': 'application/json',
    }
  end

  describe '#create' do

    example 'create record' do
      post api_v1_books_path, params: {
        books: [
          {
            name: 'book1',
            price: 100,
            release_date: '2019-10-15',
            foo: 123,
          },
        ],
      }.to_json, headers: headers
      expect(response.status).to eq 200
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body).to be_a Array
      expect(Book.count).to eq 1
    end

    example 'lower camel case' do
      post api_v1_books_path, params: {
        books: [
          {
            name: 'book1',
            price: 100,
            releaseDate: '2019-10-15',
            foo: 123,
          },
        ],
      }.to_json, headers: headers
      expect(response.status).to eq 200
      body = JSON.parse(response.body, symbolize_names: true)

      book = Book.last
      expect(Book.count).to eq 1
      expect(book.release_date).to eq '2019-10-15'.to_date
    end

    example 'nested attributes' do
      post api_v1_books_path, params: {
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
      }.to_json, headers: headers
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
      patch api_v1_book_path(book), params: {
        book: {
          id: book.id,
          name: 'book2',
          price: 200,
          release_date: '2019-10-20',
          foo: 123,
        }
      }.to_json, headers: headers
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
      patch api_v1_book_path(book), params: {
        book: {
          id: book.id,
          reviews: [
            { id: review1.id, content: '11' },
            { id: review2.id, _destroy: true },
            { content: 'new review' },
          ]
        }
      }.to_json, headers: headers
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
