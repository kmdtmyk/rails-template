# frozen_string_literal: true

class Api::V1::BooksController < Api::BaseController

  def index
    books = Book.all
    render json: books
  end

  def show
    book = Book.find(params[:id])
    render json: book
  end

  def create
    body = transform_nested_attributes(request_body)

    if body.is_a? Array
      books = body.map do |hash|
        Book.create(book_params(hash))
      end
      render json: books
    else
      book = Book.create(book_params(body))
      render json: book
    end

  end

  private

    def book_params(hash)
      ActionController::Parameters.new(hash).permit(
        :name,
        :price,
        :release_date,
        reviews_attributes: [
          :id,
          :content,
          :_destroy,
        ]
      )
    end

end
