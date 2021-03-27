class User < ApplicationRecord
  # attr_accessible :tweet_attributes
  has_many :tweets
  has_many :likes, dependent: :destroy
  has_many :friends


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def friends_count
    Friend.where(user_id: id).count
  end

  def tweets_count
    Tweet.where(user_id: id).count
  end

  def likes_count
    Like.where(user_id: id).count
  end
end
