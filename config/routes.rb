Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'
  get 'not_visible', to: 'home#not_visible'
  get '/upload', to: 'home#upload'
  get '/places', to: 'menus#index'
  get '/show_menus', to: 'menu_pages#index'
  get '/export', to: 'menus#export'
  post 'dishes/import'
  post 'menus/import'
  post 'menu_items/import'
  post 'menu_pages/import'
  
  root 'home#upload'
end
