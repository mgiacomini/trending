Rails.application.routes.draw do
  root to: 'repositories#index'
  
  resources :repositories, only: %i[index show] do
    collection do
      get :search
    end
  end
end
