require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module LibraryExercise
  class Application < Rails::Application
    config.app_generators.scaffold_controller :responders_controller
    config.load_defaults 5.1
    config.responders.flash_keys = [ :success, :failure ]
    config.generators.test_framework :rspec
  end
end
