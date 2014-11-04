class AddLogsLocationsTable < ActiveRecord::Migration
  def change
    create_table :logs_locations do |t|
      t.integer :log_id,   null: false

      t.belongs_to :location, polymorphic: true, null: false

      t.timestamps
    end
  end
end

