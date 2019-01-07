puts "Loading components..."
%w(model controller).each do |component|
  puts "  Loading #{component}..."
  Dir[File.join("app", "#{component}s", "**/*.rb")].each do |file|
    require File.expand_path(file)
    puts "    Load #{component} #{File.basename file}"
  end
end
