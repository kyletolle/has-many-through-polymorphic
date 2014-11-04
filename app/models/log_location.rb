class LogLocation < ActiveRecord::Base
  self.table_name = "logs_locations"

  after_destroy :destroy_custom_location

  belongs_to :log
  belongs_to :location, polymorphic: true

  accepts_nested_attributes_for :location

private
  def destroy_custom_location
    location.destroy if location.is_a?(CustomLocation)
  end
end

