PolyApp::Application.routes.draw do

  resources :articles, :has_many =>  :comments
  resources :photos, :has_many => :comments
  resources :events, :has_many => :comments

  root :articles
end
