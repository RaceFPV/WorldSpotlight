Rails.application.routes.draw do
  get 'map/index'
  match '/map/:id', to: 'map#show', via: 'get', as: 'country_info'
  match '/map', to: 'map#index', via: 'get'
  root 'map#index'

  #for ajax calls
  match '/map/:id/countryname', to: 'map#countryname', via: 'get', as: 'map_countryname'
  match '/map/:id/glance', to: 'map#glance', via: 'get', as: 'map_glance'
  match '/map/:id/background', to: 'map#background', via: 'get', as: 'map_background'
  match '/map/:id/twitter', to: 'map#twitter', via: 'get', as: 'map_twitter'
  match '/map/:id/news', to: 'map#news', via: 'get', as: 'map_news'
  match '/map/:id/youtube', to: 'map#youtube', via: 'get', as: 'map_youtube'

end
