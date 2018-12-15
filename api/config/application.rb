require 'bundler'
Bundler.require

Dir[File.join('controllers', '**/*_controller.rb')].each do |file|
  require File.expand_path(file)
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
