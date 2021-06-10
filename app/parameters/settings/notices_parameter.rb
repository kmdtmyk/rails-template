# frozen_string_literal: true

class Settings::NoticesParameter < Rparam::Parameter

  def index
    param :sort, save: true
  end

end
