Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  get '/currencies' => 'currencies#index'
  get '/currencies/:id' => 'currencies#show'
  get '/users/:id' => 'users#show' 
  get '/markets' => 'markets#index'
  get '/markets/:id' => 'markets#show' 
end
