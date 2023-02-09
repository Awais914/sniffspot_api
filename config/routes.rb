Rails.application.routes.draw do
  # get 'spots/index'
  namespace :api do
    namespace :v1 do
      resources :spots do
        collection do
          get :sort
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
