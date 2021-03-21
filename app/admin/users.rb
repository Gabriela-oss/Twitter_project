ActiveAdmin.register User do
  permit_params :email, :name, :photo, :created_at, :friend_id

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :photo
    column :friends_count
    column :tweets_count
    column :created_at
    actions
  end

  # filter :email
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  # form do |f|
  #   f.inputs do
  #     f.input :email
  #     f.input :password
  #     f.input :password_confirmation
  #   end
  #   f.actions
  # end

end
