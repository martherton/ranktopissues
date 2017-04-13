Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  #order of routes matter - special AJAX routes first
  get 'issues/update_categories', as: 'update_categories'
  get 'requests/update_subcategories', as: 'update_subcategories'
  get 'feed' => 'issues#feed'
  get 'download' => 'sources#download'
  get 'voting' => 'visitors#voting'
  get 'vip' => 'visitors#vip'
  get 'about' => 'visitors#about'
  get 'account' => 'users#show'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users 
  resources :requests
  
  resources :issues do	
		resources :comments
		resources :votes, only: [:create]  
		resources :sources
	end	
  resources :issuecats

 
end
