Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :spots, except: [:destroy] do
        collection do
          get :sort
        end
      end
    end
  end
end
