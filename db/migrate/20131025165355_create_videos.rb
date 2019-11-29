class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :link
      t.text :note
      t.belongs_to :filmable, index: true, polymorphic: true

      t.timestamps
    end
  end
end
