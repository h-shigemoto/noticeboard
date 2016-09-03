Rails.application.routes.draw do

  # root url
  root :to => 'boards#index'

  # path setting
  resources :boards do
    resources :board_replies, only: [:edit, :destroy]
  end

  get 'boards/search/:search_title', to: "boards#search", as: "search_boards"
end
