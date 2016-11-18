Rails.application.routes.draw do
  devise_for :admins
  root 'home#index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
end
