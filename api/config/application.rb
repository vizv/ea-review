require 'bundler'
Bundler.require

require_relative 'db_init'

puts "Loading components..."
%w(model controller).each do |component|
  puts "  Loading #{component}..."
  Dir[File.join("#{component}s", "**/*.rb")].each do |file|
    require File.expand_path(file)
    puts "    Load #{component} #{File.basename file}"
  end
end

class ApplicationController < Sinatra::Base
  use PostsController
end
