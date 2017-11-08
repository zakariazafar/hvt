# :nodoc:
class MenuItemsController < ApplicationController
  def import
    raise Error::CustomError unless MenuItem.delay.import_it param_processor
    redirect_to upload_url, notice: 'Menu Items successfully queued to load.'
  end
end
