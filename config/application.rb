# frozen_string_literal: true
require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kitahub
  # Global configurations
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified
    # here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Ensure HTTPS only
    config.force_ssl = true if Rails.env.production?

    # Use UUIDs as primary keys instead of sequence numbers
    config.active_record.primary_key = :uuid

    # Places mailer previews under lib/mailer_previews
    config.action_mailer.preview_path =
      Rails.root.join('lib', 'mailer_previews')
  end
end
