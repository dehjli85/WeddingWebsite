Rails.application.routes.draw do
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
  root :to => 'main#index'
  get 'the_big_day' => 'main#the_big_day'
  get 'our_story' => 'main#our_story'
  get 'photos' => 'main#photos'
  get 'wedding_party' => 'main#wedding_party'
  get 'lodging' => 'main#lodging'
  get 'faqs' => 'main#faqs'
  get 'registry' => 'main#registry'
  get 'rsvp' => 'main#rsvp'
  post 'rsvp/edit' => 'rsvp#edit'
  get 'rsvp/new' => 'rsvp#new'
  post 'rsvp/save' => 'rsvp#save'
  get 'rsvp/saveSubmit' => 'rsvp#saveSubmit'
  get 'rsvp/saveNewRsvp' => 'rsvp#saveNewRsvp'
  get 'rsvp/viewAllRsvp' => 'rsvp#viewAllRsvp'
  get 'rsvp/editAllRsvp' => 'rsvp#editAllRsvp'
  post 'rsvp/saveAllRsvp' => 'rsvp#saveAllRsvp'
  get 'login' => 'users#login'
  post 'post_login' => 'users#post_login'
  get 'logout' => 'users#logout'

end
