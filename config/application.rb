require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module Ponutalidademedica
  class Application < Rails::Application
    config.autoload_paths += %W["#{config.root}/app/validators/"]
    config.timezone = "Brasilia"
  end
end
