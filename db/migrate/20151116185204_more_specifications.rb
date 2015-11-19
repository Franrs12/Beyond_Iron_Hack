class MoreSpecifications < ActiveRecord::Migration
  def change
  	add_column :plants, :url_flower_image, :string
  	add_column :plants, :url_leaves_image, :string
  end
end