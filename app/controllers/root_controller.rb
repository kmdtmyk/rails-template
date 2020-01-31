# frozen_string_literal: true

class RootController < BaseController

  def index
    @notices = Notice
    .published
    .order(publish_start_datetime: :desc)
    .page(params[:page])
  end

end
