require 'api_constraints.rb'
  Rails.application.routes.draw do
    resources :ideamakers
    get 'ideahome/index'
    get 'jobhome/index'
    devise_for :users
      namespace :api do
        namespace :v1 do
          resources :sessions, :only => [:create, :destroy]
          resources :jobs
          resources :ideas 
          get "Jobhome" => "jobhome#index" 
          get "Ideahome" => "ideahome#index"
          resources :users, :only => [:show, :create, :update, :destroy]  do 
           member do   
             get "profile" => 'employees#show'
             post "profile" => 'employees#create'
             put "profile" => 'employees#update'
             delete "profile" => 'employees#destroy'
          end 
       end 
      end
    end
end
