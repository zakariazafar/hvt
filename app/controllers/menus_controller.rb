# :nodoc:
class MenusController < ApplicationController
  def import
    raise Error::CustomError unless Menu.delay.import_it param_processor
    redirect_to upload_url, notice: 'Menus successfully queued to load'
  end

  def index
    menus_scope = Menu.all_menus
    unless params[:filter].blank?
      menus_scope = menus_scope.by_place_filter(params[:filter].split(' '))
    end
    @menus = smart_listing_create(:menus, menus_scope, partial: 'menus/list')
  end

  def export
    export_menus(export_params)
  end

  private

  def export_menus(pars)
    start_date, end_date = DatetimeUtilsService.get_date_range pars[:daterange]
    menus_scope = Menu.all_menus
                      .by_place_filter(pars[:place].split(' '))
                      .by_timeframe(start_date, end_date)
    data_to_export = Menu.export_processing(menus_scope)
    send_data data_to_export[:dataset],
              type: "application/#{data_to_export[:type]}; header=present",
              disposition: "attachment; filename=menus.#{data_to_export[:type]}"
  end

  def export_params
    params.require(:export).permit :place, :daterange
  end
end
