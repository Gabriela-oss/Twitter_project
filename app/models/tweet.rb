class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

scope :tweets_for_me, ->(friend_ids) { joins(user: :friends).where(tweets: { user_id: friend_ids }) }
end
