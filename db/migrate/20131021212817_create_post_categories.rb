class CreatePostCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :post_categories do |t|
      t.belongs_to :post, index: true
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
