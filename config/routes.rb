Rails.application.routes.draw do

#  devise_for :users

#  scope "/:phrase/" do 
#    resources :passwordmanager
#  end


  get "/:phrase" => "passwordmanager#home"
##
#  get "/:phrase/passwords/" => "passwordmanager#index", as: "passwordmanager_index"
##
  post "/:phrase/passwordmanager/search" => "passwordmanager#search", as:"passwordmanager_search"
##
#  get "/:phrase/passwords/new" => "passwordmanager#new", as: "passwordmanager_new"
##
#  get "/:phrase/passwords/:id/edit" => "passwordmanager#edit", as: "passwordmanager_edit"
##
  get "/:phrase/passwordmanager/:login/show" => "passwordmanager#showLogin", as: "passwordmanager_showLogin"
##
#  post "/passwords/" => "passwordmanager#create"
##
#  patch "/passwords/:id" => "passwordmanager#update"
##
#  delete "/:phrase/passwords/:id/:route/" => "passwordmanager#delete", as: "delete_passwordmanager"
##
#  resources :password
##
 root to: "passwordmanager#home"
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
