Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "blogs#index"
  resources :users, :only => [:index]
  resources :blogs do
    resources :comments, only: [:edit, :update, :create, :destroy]
  end
  resources :contacts, only: [:new, :create] 
  post 'contacts/confirm' => 'contacts#confirm'
  post 'contacts/back' => 'contacts#back'
  get 'done' => 'contacts#done'
end
