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
    book = Book.create(book_params)
    render json: book
  end

  private

    def book_params
      params.permit(:name, :price, :release_date)
    end

end
