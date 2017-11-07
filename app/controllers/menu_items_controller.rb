# :nodoc:
class MenuItemsController < ApplicationController
  def import
    uri = params[:dataset].blank? ? nil : params[:dataset][:uri]
    raise Error::CustomError unless MenuItem.delay.import_processig(params[:file].tempfile, uri)
    redirect_to upload_url, notice: 'Menu Items imported.'
  end
end
