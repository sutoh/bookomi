class Tweet < ActiveRecord::Base
  belongs_to :manga
  paginates_per 50
  validates :tweet_id, presence: true, uniqueness: true

  def self.build_image(tweet)
    tweet_id  = tweet["tweet_id"].scan(/\/status\/(\d*)/).flatten.first
    return Hash.new if tweet_id.nil?

    client = twitter
    status = client.status(tweet_id.to_i)
    # 画像無しエラー
    # return tweet if status.media.empty?

    tweet["image_urls"] = status.media.map{|m| m.media_url.to_s}.join(',')

    tweet["user_name"] = status.user.name
    tweet["screen_name"] = status.user.screen_name
    tweet["tweet"] = status.text
    tweet["tweeted_at"] = status.created_at

    tweet
  end

  private

  def self.twitter
    Twitter::REST::Client.new do |config|
      config.consumer_key        = TWITTER_CONSUMER_KEY
      config.consumer_secret     = TWITTER_CONSUMER_SECRET
      config.access_token        = TWITTER_ACCESS_TOKEN
      config.access_token_secret = TWITTE_ACCESS_TOKEN_SECRET
    end
  end

end
