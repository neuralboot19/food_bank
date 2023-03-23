Rails.application.routes.draw do
  resources :beneficiaries, except: :show
  resources :deliveries, except: :show, patch: '/'
end
