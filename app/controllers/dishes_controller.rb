# :nodoc:
class DishesController < ApplicationController
  def import
    raise Error::CustomError unless Dish.delay.import_it param_processor
    redirect_to upload_url, notice: 'Dishes successfully queued to load.'
  end
end
