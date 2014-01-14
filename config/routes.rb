Ostaz::Application.routes.draw do
  


  resources :roles
  
  get "roles/delete_edit_ability/:id" ,to: "roles#delete_edit_ability" ,as: "delete_edit_ability"
  get "roles/delete_view_ability/:id" ,to: "roles#delete_view_ability" ,as: "delete_view_ability"
  post "roles/add_ability/:id" ,to: 'roles#add_ability' ,as: "add_ability"
  
#  get "welcome/index", as:"root"

  get "user/show/:id" , to: 'user#show', as: 'user_show'

  get "user/index"
  
  post "user/sign_up" , to:"user#create"
  get "user/sign_up" , to:"user#sign_up" ,as:'new_user_registration'
  resources :transactions


  resources :projects


  resources :accounts


  resources :account_types


#  get "welcome/index"

  
  devise_for :users
  


   
  # The priority is based upon order of creation:
  # first created -> highest priority.

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
   root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
