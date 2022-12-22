Rails.application.routes.draw do
  root 'calc#input'
  get 'calc/output'
  get 'calc/xml'
  get 'calc/json'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
