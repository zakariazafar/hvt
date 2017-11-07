# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Error::ErrorHandler
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper  
end
