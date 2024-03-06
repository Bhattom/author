Rails.application.routes.draw do
 
  resources :authors do
    collection do
      delete :bulk_delete
    end
    resources :books
  end

  resources :books do
    resources :orders 
  end
  resources :orders 
  
  resources :lineitems
  
  #  resources :orders do
  #   collection do
  #     get 'show_by_books'
  #   end
  # end

  root "orders#index"
end
