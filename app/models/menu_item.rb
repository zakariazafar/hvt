# :nodoc:
class MenuItem < ApplicationRecord
  belongs_to :dish
  include Importers
end
