class SemanticApi
  require 'semantic_handlers'
  def self.new_session
    @session = Semantria::Session.new(ENV['SEMANTRIA_CONSUMER_KEY'], ENV['SEMANTRIA_CONSUMER_SECRET'])
    callback = SessionCallbackHandler.new
    @session.setCallbackHandler(callback)
  end

  def self.send_docs source
    @tweets = source
    @tweets.each do |tweet|
      doc = {'id' => tweet['id'], 'text' => tweet['text'] }
      status = @session.queueDocument(doc)
      if status == 202
        print 'Document', doc['id'], ' queued successfully.', "\n"
      end
    end
  end

  def self.recieve_result
    length = @tweets.length
    result = []

    while result.length < length
      sleep(10)
      status = @session.getProcessedDocuments
      status.is_a? Array and status.each do |object|
        result << object
      end
      print status.length, 'documents received successfully.', "\n" 
    end
    return result
  end
  
  def self.save_result
    file = File.open('semantic_data_result.json', 'w')
    file.write(SemanticApi.recieve_result.to_json)
    file.close
  end

  def self.get_tweets
    file = File.read('semantic_data_result.json')
    tweets = JSON.parse(file)
    return tweets
  end
  
  def self.get_positive_tweets
    data = SemanticApi.get_tweets
    result = []
    data.each do |element|
      if element['status'] == "PROCESSED"
        if element['entities'][0]['sentiment_polarity'] == "positive"
          result << element
        end
      end
    end
    return result
  end
end
