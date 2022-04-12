Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  scope :api do
    scope :v1 do
      scope :users do
        get '/search', to: 'api/v1/users#search'
      end
    end
  end
end
