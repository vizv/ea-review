require 'simplecov'
SimpleCov.start do
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
end

require 'bundler'
Bundler.require(:default, :test)

require_relative '../config/db_init'
require_relative '../config/loader'

module RSpecMixin
  include Rack::Test::Methods
  def app()
    PostsController
  end
end

RSpec.configure do |config|
  config.include RSpecMixin
end
