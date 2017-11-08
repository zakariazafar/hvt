# :nodoc:
class MenuDecorator < ApplicationDecorator
  delegate_all

  def titleized_place
    titleize(place)
  end

  def titleized_venue
    titleize(venue)
  end

  def titleized_event
    titleize(event)
  end
end
