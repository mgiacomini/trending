Rails.application.routes.draw do
  resources :repositories, only: %i[index show] do
    collection do
      get :search
    end
  end
end
