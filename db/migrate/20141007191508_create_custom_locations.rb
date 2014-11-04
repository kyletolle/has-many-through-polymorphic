class CreateCustomLocations < ActiveRecord::Migration
  def change
    create_table :custom_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end

