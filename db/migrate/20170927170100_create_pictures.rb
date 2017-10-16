class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :coverpath

      t.timestamps
    end
  end
end
