FirstProject::Application.routes.draw do
  
#  get "messeges/new"
#  get "messeges/create"
#  get "messeges/list"
#  get "messeges/show"
#  get "messeges/delete"
#  get "messeges/destroy"
#  get "participation/create"
#  get "participation/destroy"
#  get "friend_invt/create"
#  get "friend_invt/destroy"
#  get "feast_invt/create"
#  get "feast_invt/destroy"
 # get "access/login"
 # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root "dishes#sort_form"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

 resources :dishes do 
    member do
      get :delete
    end
    
    collection do
      get :sort_form
      get :search_form
      post :results
      post :list
      get :list
    end
  end
  
 resources :feasts do
    member do
      get :delete
    end
    
    collection do
      get :list
    end
  end
        
  resources :posts
  
 resources :users do
    
    collection do 
      get :search
      post :list
      post :results
    end
  end  
  
  resources :access, :only => [:index] do
    
    collection do
      get :login
      post :attempt_login
      get :menu
      get :logout
    end
    
   end
  
  resources :feast_invt, :only => [:create, :destroy] 
  resources :participations, :only => [:create, :destroy] 
  resources :obligations
  resources :messeges, :except => [:edit, :update] do
    collection do
      get :list
    end
  end
  resources :replies
      
    
  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  
  
 # match ':controller(/:action(/:id))', :via => [:get, :post]
  
  
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  
end
