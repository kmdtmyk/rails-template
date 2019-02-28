# frozen_string_literal: true

class BooksController < BaseController
  before_action :set_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.search(params[:q])
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to_params_referrer_or url_for(action: :index), notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to_params_referrer_or url_for(action: :index), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to_back notice: 'Book was successfully destroyed.'
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :price, :release_date)
    end

end
