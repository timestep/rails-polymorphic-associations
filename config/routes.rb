PolyApp::Application.routes.draw do

  resources :articles
  resources :photos, :has_many => :comments
  resources :events, :has_many => :comments

  root :to => "articles#index"
end
