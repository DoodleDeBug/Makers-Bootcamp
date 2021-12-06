test_tweets = [
  "This president sucks!",
  "I hate this Blank House!",
  "I can't believe we're living under such bad leadership. We were so foolish",
  "President Presidentname is a danger to society. I hate that he's so bad – it sucks."
  ]



def clean(content)
  tweet_array = content.split(" ")
  banned_phrases = ["sucks", "bad", "hate", "foolish", "danger to society"]
  banned_phrases.each do |phrase|
    if phrase == "danger to society"
      if tweet_array.include?("danger")
        index = tweet_array.find_index("danger")
        if tweet_array[index + 1] = "to" && tweet_array[index + 2] = "society."
          tweet_array.delete_at(index + 1)
          tweet_array.delete_at(index + 1)
          tweet_array[index] = "CENSORED."
        end
      end
    elsif phrase == "sucks"
      if tweet_array.include?("sucks!")

        index = tweet_array.find_index("sucks!")
        tweet_array[index] = "CENSORED!"
      elsif tweet_array.include?("sucks.")
        index = tweet_array.find_index("sucks.")
        tweet_array[index] = "CENSORED."
      end
    end

    if tweet_array.include?(phrase)
      
      index = tweet_array.find_index(phrase)
      tweet_array[index] = "CENSORED"
    end
  end
  
  return tweet_array.join(" ")
end

test_tweets.each do |tweet|
  puts clean(tweet)
end