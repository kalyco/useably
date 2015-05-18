class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name, null: false
    end
    add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree
  end
end
