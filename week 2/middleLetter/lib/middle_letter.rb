def get_middle(word)
  length = word.length

  if length % 2 == 0 #even
    second_letter_index = length / 2 
    word[second_letter_index - 1 .. second_letter_index]
  else #odd
    if length == 1
      index_of_middle = 0
    else
    index_of_middle = (length - 1) / 2
    end
    word[index_of_middle]
  end

end