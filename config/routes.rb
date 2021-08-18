Rails.application.routes.draw do
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # dinh nghia tung phan
  #get "/articles", to: "articles#index"
  #get "/articles/:id", to: "articles#show"
  get "/contact", to: "page#contact"
  # get "/contact", to: "contacts#new"
  get "/about", to: "page#about"
  get "/special", to: "page#special"
  get "/drinks", to: "page#drinks"
  root "articles#index"
  # lay het dung resource
  resources :articles do
    resources :comments
  end

  resources :contacts
end
