class CreateMetaTags < ActiveRecord::Migration
  def change
    create_table :meta_tags do |t|
      t.string :name, null: false
      t.integer :photo_id

      t.timestamps
    end
    add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end
end
