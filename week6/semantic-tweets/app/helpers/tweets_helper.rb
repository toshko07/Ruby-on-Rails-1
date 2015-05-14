module TweetsHelper
 def is_positive? tweet
   @positive_tweets.each do |p_tweet| 
     p_tweet['source_text'] == tweet['text']
   end
 end

 def get_user id
   @tweets.select {|tweet| tweet['id'] == id.to_i }.first['user']['name']
   end
 end
 
