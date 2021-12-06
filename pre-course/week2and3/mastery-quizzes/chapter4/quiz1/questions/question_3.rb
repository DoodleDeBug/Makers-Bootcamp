# Write a program that:
# * Calculates the first 20 Fibonacci numbers.
#   * The first Fibonacci number is 0.
#   * The second Fibonacci number is 1.
#   * Every Fibonacci number after that is calculated by adding the
#     previous two Fibonacci numbers together e.g. the third Fibonacci
#     number is the result of `0 + 1`.
# * `puts`es these numbers, one per line.

sequence = [0, 1]

18.times do 
  new_num = sequence.last + sequence[-2]
  sequence.push(new_num)
end

sequence.each do |n|
  puts n
end