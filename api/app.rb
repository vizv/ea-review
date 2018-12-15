require 'bundler'
Bundler.require

%w(controllers).each do |dir|
  Dir[File.join(__dir__, '*.rb')].each(&method(:require))
end
