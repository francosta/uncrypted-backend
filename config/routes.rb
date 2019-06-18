Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'
  patch '/users' => 'users#update'
  delete '/users/:id' =>	'users#destroy'
  get '/currencies' => 'currencies#index'
  get '/currencies/:id' => 'currencies#show'
  post '/currencies' => 'currencies#create'
  patch '/currencies' => 'currencies#update'
  get '/markets' => 'markets#index'
  get '/markets/:id' => 'markets#show'
  get '/portfolios' => 'portfolios#index'
  get '/portfolios/:id' => 'portfolios#show'
  post '/portfolios' => 'portfolios#create'  
  patch '/portfolios' => 'portfolios#update'  
  delete '/portfolios/:id' =>	'portfolios#destroy'
  get '/currency_portfolios' => 'currency_portfolios#index'
  get '/currency_portfolios/:id' => 'currency_portfolios#show'

  post '/login', to: 'users#login'
end
