Rails.application.routes.draw do
  resources :repositories, only: [:index, :show] do
    collection do
      get :search
    end
  end
end
