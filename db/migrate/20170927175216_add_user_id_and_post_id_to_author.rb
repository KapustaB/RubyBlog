class AddUserIdAndPostIdToAuthor < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :user_id, :int
    add_column :authors, :post_id, :int
  end
end
