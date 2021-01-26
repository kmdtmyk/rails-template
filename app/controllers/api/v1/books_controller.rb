# frozen_string_literal: true

class Api::V1::BooksController < Api::V1::BaseController

  def index
    render json: Book.web_api_index(params)
  end

  def show
    book = Book.find(params[:id])
    render json: book
  end

  def create
    books = params[:books].each(&:transform_nested_params).map do |parameters|
      Book.create(parameters.permit(permit_values))
    end
    render json: books
  end

  def update
    book = Book.find(params[:id])
    book_params = params[:book].transform_nested_params.permit(permit_values)
    book.update(book_params)
    render json: book
  end

  private

    def permit_values
      [
        :name,
        :price,
        :release_date,
        reviews_attributes: [
          :id,
          :content,
          :_destroy,
        ]
      ]
    end

end
