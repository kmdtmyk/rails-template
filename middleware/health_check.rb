# frozen_string_literal: true

class HealthCheck

  OK_RESPONSE = [200, { 'Content-Type' => 'text/plain' }, ['ok']]
  HEALTH_PATH = '/health_check'

  def initialize(app)
    @app = app
  end

  def call(env)
    if env['PATH_INFO'] == HEALTH_PATH
      OK_RESPONSE
    else
      @app.call(env)
    end
  end

end
