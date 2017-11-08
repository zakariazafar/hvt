# :nodoc:
class Menu < ApplicationRecord
  has_many :menu_pages
  scope :all_menus, ->() { where.not(place: '') }
  scope :by_place_filter, lambda { |filter|
    where('lower(place) iLIKE ALL ( array[?] )', filter.map { |e| "%#{e}%" })
  }
  scope :by_timeframe, lambda { |start_date, end_date|
    where('date >= ? AND date <= ?', start_date, end_date)
  }
  include Importers
  include Exporters
end
