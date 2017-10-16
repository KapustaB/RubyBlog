class AddPubDateToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :pubDate, :string
  end
end
