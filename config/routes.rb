Rails.application.routes.draw do
  root "events#index"


  # Routes for the Location resource:
  # CREATE
  get "/locations/new", :controller => "locations", :action => "new"
  post "/create_location", :controller => "locations", :action => "create"

  # READ
  get "/locations", :controller => "locations", :action => "index"
  get "/locations/:id", :controller => "locations", :action => "show"

  # UPDATE
  get "/locations/:id/edit", :controller => "locations", :action => "edit"
  post "/update_location/:id", :controller => "locations", :action => "update"

  # DELETE
  get "/delete_location/:id", :controller => "locations", :action => "destroy"
  #------------------------------

  # Routes for the Event_type resource:
  # CREATE
  get "/event_types/new", :controller => "event_types", :action => "new"
  post "/create_event_type", :controller => "event_types", :action => "create"

  # READ
  get "/event_types", :controller => "event_types", :action => "index"
  get "/event_types/:id", :controller => "event_types", :action => "show"

  # UPDATE
  get "/event_types/:id/edit", :controller => "event_types", :action => "edit"
  post "/update_event_type/:id", :controller => "event_types", :action => "update"

  # DELETE
  get "/delete_event_type/:id", :controller => "event_types", :action => "destroy"
  #------------------------------

  # Routes for the Event resource:
  # CREATE
  get "/events/new", :controller => "events", :action => "new"
  post "/create_event", :controller => "events", :action => "create"

  # READ
  get "/events", :controller => "events", :action => "index"
  get "/events/:id", :controller => "events", :action => "show"

  # UPDATE
  get "/events/:id/edit", :controller => "events", :action => "edit"
  post "/update_event/:id", :controller => "events", :action => "update"

  # DELETE
  get "/delete_event/:id", :controller => "events", :action => "destroy"
  #------------------------------

  # Routes for the Kwest resource:
  # CREATE
  get "/kwests/new", :controller => "kwests", :action => "new"
  post "/create_kwest", :controller => "kwests", :action => "create"

  # READ
  get "/kwests", :controller => "kwests", :action => "index"
  get "/kwests/:id", :controller => "kwests", :action => "show"

  # UPDATE
  get "/kwests/:id/edit", :controller => "kwests", :action => "edit"
  post "/update_kwest/:id", :controller => "kwests", :action => "update"

  # DELETE
  get "/delete_kwest/:id", :controller => "kwests", :action => "destroy"
  #------------------------------

  # Routes for the Program resource:
  # CREATE
  get "/programs/new", :controller => "programs", :action => "new"
  post "/create_program", :controller => "programs", :action => "create"

  # READ
  get "/programs", :controller => "programs", :action => "index"
  get "/programs/:id", :controller => "programs", :action => "show"

  # UPDATE
  get "/programs/:id/edit", :controller => "programs", :action => "edit"
  post "/update_program/:id", :controller => "programs", :action => "update"

  # DELETE
  get "/delete_program/:id", :controller => "programs", :action => "destroy"
  #------------------------------

  # Routes for the Section resource:
  # CREATE
  get "/sections/new", :controller => "sections", :action => "new"
  post "/create_section", :controller => "sections", :action => "create"

  # READ
  get "/sections", :controller => "sections", :action => "index"
  get "/sections/:id", :controller => "sections", :action => "show"

  # UPDATE
  get "/sections/:id/edit", :controller => "sections", :action => "edit"
  post "/update_section/:id", :controller => "sections", :action => "update"

  # DELETE
  get "/delete_section/:id", :controller => "sections", :action => "destroy"
  #------------------------------

  # Routes for the Registration resource:
  # CREATE
  get "/registrations/new", :controller => "registrations", :action => "new"
  post "/create_registration", :controller => "registrations", :action => "create"

  # READ
  get "/registrations", :controller => "registrations", :action => "index"
  get "/registrations/:id", :controller => "registrations", :action => "show"

  # UPDATE
  get "/registrations/:id/edit", :controller => "registrations", :action => "edit"
  post "/update_registration/:id", :controller => "registrations", :action => "update"

  # DELETE
  get "/delete_registration/:id", :controller => "registrations", :action => "destroy"
  #------------------------------

  devise_for :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
