class AddFriendedUsersToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :friended_users, :text
  end
end
