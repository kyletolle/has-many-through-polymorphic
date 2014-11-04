class Log < ActiveRecord::Base
  validates_presence_of :entry_name

  has_many :log_locations, table_name: :logs_locations,
      foreign_key: :log_id, dependent: :destroy

  with_options through: :log_locations, source: :location do |log|
    log.has_many :custom_locations, source_type: "CustomLocation"
    log.has_many :countries,        source_type: "Country"
  end

  with_options allow_destroy: true do |log|
    log.accepts_nested_attributes_for :log_locations
    log.accepts_nested_attributes_for :custom_locations
  end
end

