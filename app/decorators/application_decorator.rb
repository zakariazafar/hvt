# :nodoc:
class ApplicationDecorator < Draper::Decorator
  def titleize(str)
    str ||= ''
    str.ljust(100).strip.gsub(/[\s\t\r\n\f]/, '_').gsub(/\W/, '').titleize
  end    
end
