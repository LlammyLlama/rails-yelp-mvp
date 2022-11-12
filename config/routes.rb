Rails.application.routes.draw do
  resources :restaurants do
    collection do
      get :top
    end
  end
end
