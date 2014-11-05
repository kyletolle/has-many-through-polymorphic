class LogLocation < ActiveRecord::Base
  self.table_name = "logs_locations"

  validate  :valid_location

  after_destroy :destroy_custom_location

  belongs_to :log
  belongs_to :location, polymorphic: true

  accepts_nested_attributes_for :location

private
  def valid_location
    location_is_valid_type =
      [CustomLocation, Country].include?(location.class)

    unless location_is_valid_type
      errors.add :location, "must be a type of location (Country, CustomLocation)"
    end
  end

  def destroy_custom_location
    location.destroy if location.is_a?(CustomLocation)
  end
end

