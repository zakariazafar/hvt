# :nodoc:
class MenuItem < ApplicationRecord
  belongs_to :dish
  delegate :name, to: :dish, prefix: true
  include Importers
end
