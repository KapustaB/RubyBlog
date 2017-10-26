class AddImageToUserAvatar < ActiveRecord::Migration[5.1]
  def change
    add_column :user_avatars, :image, :string
  end
end
