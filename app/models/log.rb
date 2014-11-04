class Log < ActiveRecord::Base
  validates_presence_of :entry_name

  has_many :log_locations, table_name: :logs_locations,
      foreign_key: :log_id, dependent: :destroy
end

