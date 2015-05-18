class AlterPhotos < ActiveRecord::Migration
  def change
    rename_column :photos, :image_url, :image_file
  end
end
