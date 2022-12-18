Rails.application.routes.draw do
  devise_for :users
  unauthenticated :user do
    root to: 'user#index'
  end

  authenticated :user do
    root 'group#index', as: :authenticated_root
  end
  
  resources :group, only: %i[index new create] do
    resources :entity, only: %i[index new create]
  end
end
