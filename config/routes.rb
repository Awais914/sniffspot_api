Rails.application.routes.draw do
<<<<<<< Updated upstream
=======
<<<<<<< Updated upstream
  get 'spots/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
=======
>>>>>>> Stashed changes
  namespace :api do
    namespace :v1 do
      resources :spots, except: [:destroy] do
        collection do
          get :sort
        end
<<<<<<< Updated upstream
      end
    end
  end
=======
        resources :reviews, only:[:create, :update]
      end
    end
  end
>>>>>>> Stashed changes
>>>>>>> Stashed changes
end
