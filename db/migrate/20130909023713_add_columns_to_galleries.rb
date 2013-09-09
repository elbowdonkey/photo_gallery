class AddColumnsToGalleries < ActiveRecord::Migration
  def change
    add_column :galleries, :photos_count, :integer, default: 0
  end
end
