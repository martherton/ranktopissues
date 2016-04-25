Rails.application.routes.draw do
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :issues do	
		resources :comments
		resources :votes
		resources :sources
	end	
  resources :issuecats
 
 
end
