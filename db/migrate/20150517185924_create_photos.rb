class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :user_id
      t.integer :album_id
      t.string :name, null: false
      t.text :description
      t.integer :likes, default: 0
      t.string :image_url
      t.string :source
      t.string :source_name

      t.timestamps
    end
  end
end
