class CreatePostCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :post_categories do |t|
      t.int :post_id
      t.int :category_id

      t.timestamps
    end
  end
end
