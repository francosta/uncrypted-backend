Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users' => 'users#index'
<<<<<<< HEAD
  get '/users/:id' => 'users#show'
  get '/currencies' => 'currencies#index'
  get '/currencies/:id' => 'currencies#show'
=======
  get '/users/:id' => 'users#show' 
  get '/markets' => 'markets#index'
  get '/markets/:id' => 'markets#show' 
>>>>>>> 785160692d996dd0484ffab7f4b20ea0aa1c43c0
end
