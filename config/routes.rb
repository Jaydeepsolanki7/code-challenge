Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :challenges
    end
  end
end
