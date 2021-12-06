puts "Type the word from the following list that you want the definition of:[Bear, River, Salmon]"

word = gets.chomp.downcase

definitions = {
  "bear" => "A creature that fishes in the river for salmon.",
  "river" => "A body of water that contains salmon, and sometimes bears.",
  "salmon" => "A fish, sometimes in a river, sometimes in a bear, and sometimes in both."
}

puts definitions[word]