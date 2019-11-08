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
    body = request_body

    if body.is_a? Array
      books = body.map do |json|
        Book.create(json)
      end
      render json: books
    else
      book = Book.create(body)
      render json: book
    end

  end

  private

    def book_params
      params.permit(:name, :price, :release_date)
    end

end
