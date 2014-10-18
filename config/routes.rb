Rails.application.routes.draw do
  get 'map/index'
  match '/map/:id', to: 'map#show', via: 'get', as: 'country_info'
  root 'map#index'

end
