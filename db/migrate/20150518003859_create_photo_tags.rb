class CreatePhotoTags < ActiveRecord::Migration
  def change
    create_table :photo_tags do |t|
      t.integer :photo_id
      t.integer :tag_id
    end
    add_index "photo_tags", ["tag_id", "photo_id"], name: "index_photo_tags_on_tag_id_and_photo_id", unique: true, using: :btree
  end
end
