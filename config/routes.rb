Rails.application.routes.draw do
  get 'map/index'

  get 'map/show'
  
  root 'map#index'

end
