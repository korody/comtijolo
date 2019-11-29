class AddHtmlToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :html, :text
  end
end