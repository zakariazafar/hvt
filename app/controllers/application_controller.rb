# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Error::ErrorHandler
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def param_processor
    uri = params[:dataset].blank? ? nil : params[:dataset][:uri]
    file = uri.nil? ? FileUtilsService.move_temp_file(params[:file]) : nil
    [file, uri]
  end
end
