# :nodoc:
class MenuPagesController < ApplicationController
  def import
    raise Error::CustomError unless MenuPage.delay.import_it param_processor
    redirect_to upload_url, notice: 'Menu pages successfully queued to load.'
  end

  def index
    menus_scope = MenuPage.menu_all_pages params[:menu_id]
    @menus = smart_listing_create :menu_pages,
                                  menus_scope,
                                  partial: 'menu_pages/list'
  end
end
