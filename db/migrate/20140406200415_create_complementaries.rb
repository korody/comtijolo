class CreateComplementaries < ActiveRecord::Migration[5.1]
  def change
    create_table :complementaries do |t|
      t.integer :post_id
      t.integer :complement_id

      t.timestamps
    end
  end
end
