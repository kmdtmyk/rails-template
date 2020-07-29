# frozen_string_literal: true

class BooksController < BaseController
  include StreamingDownload

  before_action :apply_rparam
  before_action :set_book, only: [:edit, :update, :destroy]

  def index
    @books = Book
      .search(params[:q])
      .order_by(params[:sort], params[:order])

    respond_to do |format|
      format.html { render layout: 'wide' }
      format.csv { download_csv(@books) }
    end
  end

  def download_csv(books)
    streaming_download('books.csv') do |stream|
      CsvGenerator::Book.generate(books) do |csv|
        stream.write csv
      end
    end
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.created_by(current_user)
    if @book.save
      redirect_to_params_referrer_or url_for(action: :index), notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    @book.updated_by(current_user)
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
      params.require(:book).permit(
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
