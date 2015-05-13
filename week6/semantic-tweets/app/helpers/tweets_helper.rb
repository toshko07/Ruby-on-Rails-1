module TweetsHelper
 def is_positive? tweet
   @positive_tweets.each do |p_tweet| 
     p_tweet['source_text'] == tweet['text']
   end
 end
end  
