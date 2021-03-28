class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_and_belongs_to_many :hashtags
  scope :tweets_for_me, ->(friend_ids) { joins(user: :friends).where(tweets: { user_id: friend_ids }) }

  after_create do
    tweet = Tweet.find_by(user_id: self.id)
    tags = self.content.scan(/#\w+/)
    tags.uniq.map do |tag|
      hashtag = Hashtag.find_or_create_by(name: tag.downcase.delete('#'))
      tweet.hashtags << tag
    end
  end
  before_update do
    tweet = Tweet.find_by(id: self.id)
    tweet.hashtags.clear
      tags = self.content.scan(/#\w+/)
      tags.uniq.map do |tag|
      hashtag = Hashtag.find_or_create_by(name: tag.downcase.delete('#'))
      tweet.hashtags << tag
    end
  end

end
