class FriendsController < ApplicationController

  def create
    f = current_user.friends.build friends_id: 1
  end

end
