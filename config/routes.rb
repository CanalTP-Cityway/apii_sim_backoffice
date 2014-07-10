ApiiSimBackoffice::Application.routes.draw do
  resources :stop_searches, only: [:new, :create]

  resources :stops, only: [:index, :show] do
    resources :connections do
      member do
        patch :invalidate_connection
        patch :validate_connection
      end
      #get 'invalidate_connection', :on => :connection, :as => invalidate_connection
    end 
  end

  resources :mi_systems, only: [:index, :show] do
    #resources :stops, only: [:index, :show]
    #resources :connections, only: [:index, :show]
    member do
      get :stops
      get :connections
    end
  end
  
  get '/mi_systems/:mi_system_id/connections/:id', to: 'mi_systems#show_connection'
  get '/mi_systems/:mi_system_id/stops/:id', to: 'mi_systems#show_stop'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

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
