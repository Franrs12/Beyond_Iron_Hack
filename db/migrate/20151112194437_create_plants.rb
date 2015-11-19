class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :common_name
      t.string :scientific_name
      t.integer :max_temp
      t.integer :min_temp
      t.text :description
      t.string :url_image

      t.timestamps null: false
    end
  end
end
