Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  get '/currencies' => 'currencies#index'
  get '/currencies/:id' => 'currencies#show'
  post '/currencies' => 'currencies#create'
  patch '/currencies' => 'currencies#update'
  get '/markets' => 'markets#index'
  get '/markets/:id' => 'markets#show'
<<<<<<< HEAD
  get '/portfolios' => 'portfolios#index'
  get '/portfolios/:id' => 'portfolios#show'  
=======
  get '/currency_portfolios' => 'currency_portfolios#index'
  get '/currency_portfolios/:id' => 'currency_portfolios#show'
>>>>>>> c1a47e13f20acdef7aa3f1ad0703765ca5835e7a
end
