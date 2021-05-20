Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # namespace :admins do

  # end

  # ユーザー側のデバイス
  devise_for :patients, controllers: {
    :sessions => 'patients/sessions',
    :registrations => 'patients/registrations',
  }

  root 'homes#top'
  get 'about' => "homes#about"
  get 'admins' => "homes#admins"
  get 'patients/mypage' => 'patients#show', as: 'mypage'
  get 'search' => 'searches#search'
  resources :reservations
  resources :maps, only: [:about]
  resources :patients, only: [:edit, :update]
  # resources :admin, only: [:index, :show, :edit, :update]
  resources :sicks, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: '/letter_opener'
end
