class CreateSearchCount < ActiveRecord::Migration
  def change
    create_table :search_counts do |t|
      t.integer :count, default: 0
      t.string :title

      t.timestamps
    end
  end
end
