# :nodoc:
class DishesController < ApplicationController
  def import
    uri = params[:dataset].blank? ? nil : params[:dataset][:uri]
    raise Error::CustomError unless Dish.import_processig(params[:file], uri)
    redirect_to upload_url, notice: 'Dishes imported.'
  end
end
