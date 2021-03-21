class Friend < ApplicationRecord
  belongs_to :user
  belongs_to :my_friends, class_name: "Friend"
end
