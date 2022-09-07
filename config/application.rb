# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.eager_load_paths << Rails.root.join("extras")

    config.time_zone = "Moscow"

    # Permitted locales available for the application
    I18n.available_locales = %i[en ru]

    # Set default locale
    I18n.default_locale = :ru

    add_error_div_proc = ActionView::Base.field_error_proc
    config.action_view.field_error_proc = ->(html_tag, instance) {
      html_tag && html_tag.start_with?("<label") ? html_tag : add_error_div_proc.call(html_tag, instance) }
  end
end
