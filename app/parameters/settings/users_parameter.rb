# frozen_string_literal: true

class Settings::UsersParameter < Rparam::Parameter

  def index
    param :sort, save: true
    param :order, save: true, inclusion: %w(asc desc)
  end

end
