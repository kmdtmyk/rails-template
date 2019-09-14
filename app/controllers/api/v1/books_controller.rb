
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

end
