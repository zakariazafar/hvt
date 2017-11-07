# :nodoc:
class MenusController < ApplicationController
  def import
    uri = params[:dataset].blank? ? nil : params[:dataset][:uri]
    raise Error::CustomError unless Menu.delay.import_processig(params[:file].tempfile, uri)
    redirect_to upload_url, notice: 'Menus imported.'
  end

  def index
    menus_scope = Menu.all_menus
    if !params[:filter].blank?
      menus_scope = menus_scope.by_place_filter(params[:filter].split(' '))
    end
    @menus = smart_listing_create(:menus, menus_scope, partial: 'menus/list')
  end

  def export
    export_menus(export_params)
  end

  private
  def export_menus(pars)
    menus_scope = Menu.all_menus
    menus_scope = menus_scope.by_place_filter(pars[:place].split(' '))
    processed_dataset_to_export = Menu.export_processing(menus_scope)
    send_data processed_dataset_to_export[:dataset], :type => "application/#{processed_dataset_to_export[:type]}; header=present", :disposition => "attachment; filename=menus.#{processed_dataset_to_export[:type]}"
  end

  def export_params
    params.require(:export).permit :place, :daterange
  end 
end
