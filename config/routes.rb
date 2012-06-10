RailsApp::Application.routes.draw do
  resources :statuses
  root :to => 'statuses#index'
  resources :statuses,
    :only => [:index, :edit]
  #devise_for :users
  match 'false', :to => 'statuses#index'
  match '*path', :to => 'application#error_404'
end
