# :nodoc:
class MenuPage < ApplicationRecord
  has_many :menu_items
  has_many :dishes, through: :menu_items
  scope :menu_all_pages, lambda { |menu|
    where(menu_id: menu).includes(:dishes)
  }
  include Importers
end
