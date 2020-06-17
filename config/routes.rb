require 'api_constraints.rb'
  Rails.application.routes.draw do

    devise_for :users
      namespace :api do
        namespace :v1 do
          resources :sessions, :only => [:create, :destroy] 
          resources :jobs 
          resources :ideas 

          resources :users, :only => [:show, :create, :update, :destroy]  do 
           member do   
             get "profile" => 'profiles#show'
             post "profile" => 'profiles#create'
             put "profile" => 'profiles#update'
             delete "profile" => 'profiles#destroy'
          end 
        end

          post "submittings" => 'submittings#create' 
          get "submittings" => 'submittings#userapplication'
          get "submittings/:id" => 'submittings#show'
          get "submittingsa" => 'submittings#Jobapplication'
          #get "submittingsall" => 'submittings#all'

          post "funds" => 'funds#create'
          get "funds" => 'funds#sponserapplication'
          get "funds/:id" => 'funds#show'
          get "ideafund" => 'funds#Ideaapplication'
  

          
        
          get "Jobhome" => "jobhome#index" 
          get "Jobhome/:id" => "jobhome#show" 
          get "Ideahome" => "ideahome#index"
          get "Ideahome/:id" => "ideahome#show" 
          
          post "Response"=> 'jobresponses#create'

       

       end 
      end
    end
  
