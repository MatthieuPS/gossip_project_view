Rails.application.routes.draw do
  get 'home/index', to: 'home#index'
  get '/static_pages/contact', to: 'static_pages#contact'
  get 'static_pages/team', to: 'static_pages#team'
  get 'welcome/:user_entry', to: 'welcome#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
