Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "blogs#index"
  resources :blogs
  resources :contacts, only: [:new, :create] 
  post 'contacts/confirm' => 'contacts#confirm'
  post 'contacts/back' => 'contacts#back'
  get 'done' => 'contacts#done'
  
end
