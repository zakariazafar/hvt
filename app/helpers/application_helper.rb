module ApplicationHelper
  def show_panel_header
      current_page?(controller: 'home', action: 'upload') ? 'Import dataset' : (current_page?(controller: 'menu_pages', action: 'index') ? 'Dishes' : 'Menu List')
  end
  def activated_link(link)
      if link == 'import'
      	return current_page?(controller: 'home', action: 'upload') ? 'active' : ''
      else
      	return !current_page?(controller: 'home', action: 'upload') ? 'active' : ''
      end
  end
end
