class TweetsController < ApplicationController
  
  def index
    @tweets = TwitterApi.get_tweets  
  end

  def new
    @tweets = TwitterApi.save_tweets
    @tweets = TwitterApi.get_tweets
    new_session = SemanticApi.new_session
    send_docs = SemanticApi.send_docs @tweets
    @saved_result = SemanticApi.save_result
  end

  def positive_tweets
    @tweets = TwitterApi.get_tweets
    @positive_tweets = SemanticApi.get_positive_tweets
  end
end
