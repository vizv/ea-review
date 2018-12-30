require 'simplecov'
SimpleCov.start do
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
end

require 'bundler'
Bundler.require

require_relative '../config/db_init'
require_relative '../config/loader'

# RSpec.configure do |config|
# end
