class LikesController < ApplicationController
  before_action :find_tweet
  before_action :authenticate_user!, only: %i[ create ]

  
  def create
    
    result  = @tweet.likes.where(user_id: current_user.id).first
    if result
      result.destroy
    else
      @tweet.likes.create(user_id: current_user.id)
    end
    
    if already_liked?
      flash[:notice] = "You can't like more than once"
    end

    redirect_to tweets_path
  end
  
  private
  
  def find_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
   
  def already_liked?
    Like.where(user_id: current_user.id, tweet_id:
    params[:tweet_id]).exists?
  end
end