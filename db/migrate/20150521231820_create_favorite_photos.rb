class CreateFavoritePhotos < ActiveRecord::Migration
  def change
    create_table :favorite_photos do |t|
      t.integer :user_id, null: false
      t.integer :photo_id, null: false

      t.timestamps
    end
  end
end
