Rails.application.routes.draw do

  # root url
  root :to => 'boards#index'

  # path setting
  resources :boards do
    resources :board_replies, only: [:edit, :create, :update, :destroy]
  end
end
