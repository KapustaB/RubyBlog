class CreateUserAvatars < ActiveRecord::Migration[5.1]
  def change
    create_table :user_avatars do |t|

      t.timestamps
    end
  end
end
