class AddAvatarpathToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :avatarPath, :string
  end
end
