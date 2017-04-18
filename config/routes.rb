Rails.application.routes.draw do
  get 'about' => 'pages#about', as: :about
  get 'contact' => 'pages#contact', as: :contact

  root 'posts#index'
  resources :posts
end
