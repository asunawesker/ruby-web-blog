Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

  # Adding a route that maps the root path of our application to the appropriate controller and action.
  root "articles#index"

  # The route above declares that GET /articles requests are mapped to the index action of ArticlesController.
  # get "/articles", to: "articles#index"

  # :id designates a route parameter. A route parameter captures a segment of the request's path, and puts that
  # value into the params Hash, which is accessible by the controller action.
  #get "/articles/:id", to: "articles#show"

  # Rails provides a routes method named resources that maps all of the conventional routes for a collection of
  # resources
  resources :articles
end
