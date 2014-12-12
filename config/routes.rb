Blog::Application.routes.draw do
  resources :feedbacks

  resources :time_allocates

  resources :eq_maintains

  get "search/index"

  resources :yy_informations

  get "admin/index"

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  get 'admin'=>'admin#index'

  get 'search'=>'search#index'
  #match':controller(/:action(/:id(.:format)))'
  match 'articles/add/:id',:to=>'yy_informations#add',:as=>'add_yy_information'
  match 'articles/status_change/:id',:to=>'articles#status_change',:as=>'status_change_article'
  match 'articles/status_maintain',:to=>'articles#status_maintain',:as=>'status_maintain_article'
  match 'eq_maintains/add/:id',:to=>'eq_maintains#add',:as=>'add_eq_maintain'
  match 'time_allocates/add/:id',:to=>'time_allocates#add',:as=>'add_time_allocate'
  match 'time_allocates/lookup/:id',:to=>'time_allocates#lookup',:as=>'lookup_time_allocate'
  match 'time_allocates/personal_account/:id',:to=>'time_allocates#personal_account',:as=>'personal_account_time_allocate'
  match 'time_allocates/pay/:id',:to=>'time_allocates#pay',:as=>'pay_time_allocate'
  match 'feedbacks/add/:id',:to=>'feedbacks#add',:as=>'add_feedback'
  match 'yy_informations/status_change/:id',:to=>'yy_informations#status_change',:as=>'status_change_yy_information'
  post 'search'=>'articles#search'
  post'/search_status'=>'articles#search_status'
  controller :sessions do
    get 'login'=> :new
    post 'login'=> :create
    post 'sessions/new'=>:create
    get 'logout' =>:destroy
  end
  resources :users

  resources :articles

  get "home/index"

  root :to => "home#index"
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
