Rails.application.routes.draw do
  
  resources :blogs
  resources :contacts, only: [:new, :create] 
  post 'contacts/confirm' => 'contacts#confirm'
  post 'contacts/back' => 'contacts#back'
  get 'done' => 'contacts#done'
  
end
