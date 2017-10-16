class RemovePubDateFromPost < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :pubDate
  end
end
