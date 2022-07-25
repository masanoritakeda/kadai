Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "blogs#index"
  resources :users, :only => [:index] do 
    member do
      get :likes
      
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
    post :relationships, to: 'relationships#create'
    delete :unrelationships, to: 'relationships#destroy'
    get :relationships, to: 'relationships#create'
    get :unrelationships, to: 'relationships#create'
    
    
  end
  resources :blogs do
    resources :comments, only: [:edit, :update, :create, :destroy]
    post :favorites, to: 'favorites#create'
    delete :unfavorites, to: 'favorites#destroy'
    get :favorites, to: 'favorites#create'
    get :unfavorites, to: 'favorites#create'
  end
  resources :contacts, only: [:new, :create] 
  post 'contacts/confirm' => 'contacts#confirm'
  post 'contacts/back' => 'contacts#back'
  post 'contacts/done' => 'contacts#done'
end
