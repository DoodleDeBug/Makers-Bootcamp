puts "What is your name?"

name = gets.chomp!

if name[0].downcase == "s"
  puts name.upcase
else 
  puts "Hi, #{name}!"
end