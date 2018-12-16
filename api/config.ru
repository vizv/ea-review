require File.expand_path(File.join('config', 'application'))

map('/api/v1') { run ApplicationController }
