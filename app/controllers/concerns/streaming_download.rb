# frozen_string_literal: true

module StreamingDownload
  extend ActiveSupport::Concern

  include ActionController::Live

  included do

    def streaming_download(filename)
      filename = ERB::Util.url_encode(filename)
      response.headers['Content-Disposition'] = "attachment; filename=\"#{filename}\""
      response.headers['Content-Type'] = 'text/event-stream'
      yield response.stream
    ensure
      response.stream.close
    end

  end

end
