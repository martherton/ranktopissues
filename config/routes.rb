Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  #order of routes matter - special AJAX routes first
  get 'issues/update_categories', as: 'update_categories'
  devise_for :users
  resources :users
  resources :issues do	
		resources :comments
		resources :votes
		resources :sources
	end	
  resources :issuecats
  
 
end
