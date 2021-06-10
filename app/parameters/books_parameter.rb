# frozen_string_literal: true

class BooksParameter < Rparam::Parameter

  def index
    param :sort, save: true
  end

end
