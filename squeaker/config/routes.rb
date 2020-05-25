Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # write routes, combination of method and paths
  # VERB(method)  +    PATH => (which controllers and which action)
    # get "/squeaks", to: "squeaks#index" #standard way of writing routes
    # get "/squeaks/:id", to: "squeaks#show"
    # post "/squeaks", to: "squeaks#create"
    # patch "/squeaks/:id", to: "squeaks#update"
    # put "/squeaks/:id", to: "squeaks#update"
    # delete "/squeaks/:id", to: "squeaks#destroy"
    # :wildcard (ex. :id) after :, anything can come afterwards but id is most common
    # why some need id some don't
    # - line 6 only cares about one single squeak unlike line 5 which wants all squeaks(no point of having wildcard)
    # - Therefore, for patch and put delete, you need to indicate which squeak you are exactly want to patch, put or delete

  # send to controller Squeaks's index action(a method named with action)

  #simple way of writing routes
  #resources + controller + (only) + array of symbol actions
  # resources(:squeaks, only: [:index, :show, :new, :create, :edit, :update, :destroy])
  # resource is a method to generate routes based on the arguments
  # #resources(controller, list of actions)
  # if you don't give the list of actions, it will generate all actions by default
  
  # you will have an error if you don't have routes set up for your controller actions. 
  
  # get "/set_cookie", to:"squeaks#set_cookie"
  # get "/get_cookie", to:"squeaks#get_cookie"
  
  # resource :session, only: [:new, :create, :destroy]
  # resources :users, only: [:new, :create]

  root to: 'static_pages#root'

  namespace :api, defaults: {format: :json} do
    resources :squeaks, only: [:index, :show, :new, :create, :edit, :update, :destroy] 
    resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create]
  end


end
