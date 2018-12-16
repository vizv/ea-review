require 'bundler'
Bundler.require

require_relative 'db_init'

puts "Loading components..."
%w(model controller).each do |component|
  puts "  Loading #{component}..."
  Dir[File.join("#{component}s", "**/*_#{component}.rb")].each do |file|
    require File.expand_path(file)
    puts "    Load #{component} #{File.basename file}"
  end
end

module EAReviewApp
  class ApplicationController < Sinatra::Base
    # register all controllers
    EAReviewApp.constants.select do |symbol|
      const = EAReviewApp.const_get(symbol)
      use const if const.is_a?(Class) and (const != self)
    end
  end
end
