Rails.application.routes.draw do
  root "posts#index"
  resources :posts do # creates routes for every action to test run 'rake routes' in root folder
    resources :comments # creates nested routes from posts to comments
  end
end
