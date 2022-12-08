Rails.application.routes.draw do
  resources :configuracaos
  
  root 'home#index'
end
