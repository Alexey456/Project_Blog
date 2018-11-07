Rails.application.routes.draw do
  root 'links#index'

  resources :links, except: :index do
    resources :comments, only: [:create, :edit, :update, :destroy]
    post :upvote, on: :member
    post :downvote, on: :member
  end

  get '/comments' => 'comments#index'
  get '/newest' => 'links#newest', as: :newest_links

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  resources :users, only: [:new, :create]
end
