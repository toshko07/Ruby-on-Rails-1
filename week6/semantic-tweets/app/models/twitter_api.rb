class TwitterApi
  def self.save_tweets
    file = File.new('twitter_data.json', 'w')
    file.write($twitter.home_timeline.to_json)
    file.close
  end

  def self.get_tweets
    file = File.read('twitter_data.json')
    tweets = JSON.parse(file)
    return tweets
  end
end
