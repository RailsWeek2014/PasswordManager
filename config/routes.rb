Rails.application.routes.draw do

  devise_for :users

  delete "/:phrase/passwords/:id/:route/" => "passwords#destroy", as: "destroy_password"

  get "/:phrase" => "passwordmanager#home"

  post "/:phrase/passwordmanager/search" => "passwordmanager#search", as:"passwordmanager_search"

  post "/:phrase/passwordmanager/order" => "passwordmanager#order", as: "passwordmanager_order"

  post "/:phrase/passwordmanager/getallpasswords" => "passwordmanager#getAllPasswords", as: "get_all_passwords_passwordmanager"

  get "/:phrase/passwordmanager/:login/show" => "passwordmanager#showLogin", as: "passwordmanager_showLogin"

  get "/:phrase/passwordmanager/editphrase" => "passwordmanager#editphrase", as:"edit_phrase_passwordmanager"

  patch "/:phrase/passwords/updateAllPasswd" => "passwords#updateAllPassw", as: "update_all_passwd_passwords"

  scope "/:phrase/" do 
    resources :passwordmanager, :passwords
  end

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
