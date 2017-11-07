class ApplicationDecorator < Draper::Decorator
  # Define methods for all decorated objects.
  # Helpers are accessed through `helpers` (aka `h`). For example:
  #
  #   def percent_amount
  #     h.number_to_percentage object.amount, precision: 2
  #   end
  def slugify(str)
    str.ljust(100).strip.gsub(/[\s\t\r\n\f]/, '_').gsub(/\W/, '').downcase
  end

  def titleize(str)
    str ||=""
  	str.ljust(100).strip.gsub(/[\s\t\r\n\f]/, '_').gsub(/\W/, '').titleize
  end
end
