class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :entry_name

      t.timestamps
    end
  end
end

