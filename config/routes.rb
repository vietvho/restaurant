Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # dinh nghia tung phan
  get "/contact", to: "page#contact"
  get "/about", to: "page#about"
  get "/special", to: "page#special"
  get "/drinks", to: "page#drinks"
  
  root "articles#index"
  # lay het dung resource
  resources :articles

  post '/articles', to: 'articles#create', mob: 'true'


  resources :contacts
end
