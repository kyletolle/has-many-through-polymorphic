class LogLocation < ActiveRecord::Base
  self.table_name = "logs_locations"

  belongs_to :log
  belongs_to :location, polymorphic: true
end
