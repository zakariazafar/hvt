# :nodoc:
class Menu < ApplicationRecord
  has_many :menu_pages
  scope :all_menus, ->() { all }
  # scope :by_venue, -> (venue) { where("venue iLIKE ANY ( array[?] )", venue)}
  # scope :by_event, -> (event) { where("event iLIKE ANY ( array[?] )", event)}
  # scope :by_places, -> (place) { where("place iLIKE ?", "%#{place}%")}
  scope :by_place_filter, -> (filter) { where("lower(place) iLIKE ALL ( array[?] )", filter.map do |e| "%#{e}%" end)}
  scope :by_timeframe, -> (start_date, end_date) { where("date >= ? AND date <= ?", start_date, end_date )}
  include Importers
  include Exporters
end
