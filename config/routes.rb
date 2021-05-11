Rails.application.routes.draw do

  # ユーザー側のデバイス
  devise_for :patients
  root 'homes#top'
  get 'about' => "homes#about"
  resources :maps, only: [:about]
  resources :sicks, only: [:index]
  resources :patients, only: [:show, :edit, :update]
  resources :admin, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
