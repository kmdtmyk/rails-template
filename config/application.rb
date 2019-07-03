require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.i18n.default_locale = :ja
    config.time_zone = 'Asia/Tokyo'
    config.active_record.default_timezone = :local
    config.action_controller.include_all_helpers = false
    config.generators do |g|
      g.test_framework false
    end

    # rack dev mark
    if ENV['RACK_DEV_MARK'].present?
      config.rack_dev_mark.enable = true
      config.rack_dev_mark.env = "#{ENV['RACK_DEV_MARK']}".force_encoding('UTF-8')
      config.rack_dev_mark.theme = [:title, Rack::DevMark::Theme::GithubForkRibbon.new(
        position: ENV['RACK_DEV_MARK_POSITION'],
        fixed: true,
        color: 'red')
      ]
    end

    # health check
    require_dependency Rails.root.join('middleware/health_check')
    config.middleware.insert_before Rails::Rack::Logger, HealthCheck
  end
end
