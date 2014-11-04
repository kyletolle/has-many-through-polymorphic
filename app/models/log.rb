class Log < ActiveRecord::Base
  validates_presence_of :entry_name
end

