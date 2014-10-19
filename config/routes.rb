Rails.application.routes.draw do
  get 'map/index'
  match '/map/:id', to: 'map#show', via: 'get', as: 'country_info'
  match '/map', to: 'map#index', via: 'get'
  root 'map#index'

end
