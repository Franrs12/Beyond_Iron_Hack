class AddWateringToPlants < ActiveRecord::Migration
  def change
    add_column :plants, :watering, :string
  end
end
