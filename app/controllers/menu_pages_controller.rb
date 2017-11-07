# :nodoc:
class MenuPagesController < ApplicationController
  def import
    uri = params[:dataset].blank? ? nil : params[:dataset][:uri]
    raise Error::CustomError unless MenuPage.delay.import_processig(params[:file].tempfile, uri)
    redirect_to upload_url, notice: 'Menu pages imported.'
  end

  def index
    menus_scope = MenuPage.menu_all_pages(params[:menu_id])
    @menus = smart_listing_create(:menu_pages, menus_scope, partial: 'menu_pages/list')
  end
end
