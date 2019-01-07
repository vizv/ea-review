require 'bundler'
Bundler.require

require_relative 'db_init'
require_relative 'db_seed'
require_relative 'loader'

class ApplicationController < Sinatra::Base
  use PostsController
end
