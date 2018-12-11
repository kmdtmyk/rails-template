# frozen_string_literal: true

class HealthChecksController < ApplicationController

  def show
    render plain: 'ok'
  end

end
