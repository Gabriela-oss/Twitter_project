class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_and_belongs_to_many :hashtags
  scope :tweets_for_me, ->(friend_ids) { joins(user: :friends).where(tweets: { user_id: friend_ids }) }

end
