file = File.absolute_path(__FILE__)

File.readlines(file).each do |line|
  print line
end
