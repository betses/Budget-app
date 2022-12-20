Rails.application.routes.draw do
  devise_for :users
  unauthenticated :user do
    root to: 'user#index'
  end

  authenticated :user do
    root 'group#index', as: :authenticated_root
  end
  
  resources :group, only: %i[index show new create destroy] do
    resources :entity, only: %i[index new create destroy]
  end
end
