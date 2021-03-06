TrantorManagementSystem::Application.routes.draw do
 
  # Devise
  devise_for :users, :controllers => { :confirmations => "confirmations" }
  as :user do
    match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  
  # Admin
  match '/admin' => 'admin/users#index', :as => :admin
  namespace :admin do
    resources :users do as_routes end
    resources :bands do as_routes end
    resources :banks do as_routes end
    resources :designations do as_routes end
    resources :emp_types do as_routes end
    resources :holidays do as_routes end
    resources :leave_types do as_routes end
    resources :projects do as_routes end
  end
  
  resources :events do 
    collection do 
     get :remove_event
    end
  end

  resources :employees do
    collection do
      get :unconfirmed_user,:csv_import,:all_employees,:history ,:render_projects
    end
  end
  
  resources :projects do
    collection do
     get :all_record
    end
  end
  
  resources :bands do
    collection do
     get :all_record
    end
  end
  
  resources :designations do
    collection do
     get :all_record
    end
  end
  
  get "document/index"
  get "document/show"

  match 'document' => 'document#document'
  match 'document/index' =>  'document#index'
  match 'dashboard' =>  'dashboard#dashboard'
  match 'calender' => 'leavemanagements#calender'

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'dashboard#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
