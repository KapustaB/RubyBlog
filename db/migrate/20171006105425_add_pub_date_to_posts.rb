class AddPubDateToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :pubDate, :datetime
  end
end
