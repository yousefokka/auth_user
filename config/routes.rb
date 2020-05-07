require 'api_constraints.rb'
Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 # resources :users, :only => [:show, :create, :update, :destroy]
  #resources :sessions, :only => [:create, :destroy]
  
 # namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
  #  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # We are going to list our resources here

      namespace :api do
        namespace :v1 do
      resources :users, :only => [:show, :create, :update, :destroy] 
         resources :ideas
         resources :jobs
      
        end
      end
      resources :sessions, :only => [:create, :destroy]
   # end
  #end
end
