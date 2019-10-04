class TweetStreamsController < ApplicationController
  attr_accessor :twitter_client

  def new
  end

  def create
    @user_name = params[:twitter_handle]
    @tweets = twitter_client.user_timeline(@user_name)
    @user_details = twitter_client.user(@user_name)

    @follower_count = @user_details.followers_count

    translation_service = TranslationService.new
    translated_text = translation_service.translate(@user_details.description, 'en')
    @tokens = translation_service.tokenize_text(translated_text)
  end

  def twitter_client
    @twitter_client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = "QmnF0N1nALWJCshk5ecUWXG2n"
      config.consumer_secret = "N7PoX41YI7YHinZw5qI9XmOskX0nzw60GPtMuQGb7UY6oNh853"
    end
  end
end
