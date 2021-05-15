Rails.application.routes.draw do

  # 管理者側のデバイス
   devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }
  namespace :admin do
    root 'admin#index'
    resources :sicks, only: [:index]
  end

  # ユーザー側のデバイス
    devise_for :patients, controllers: {
    :sessions => 'patients/sessions',
    :registrations => 'patients/registrations'
  }

  # devise_for :admin

  # devise_for :patients
  root 'homes#top'
  get 'about' => "homes#about"
  get 'patients/mypage' => 'patients#show', as: 'mypage'
  resources :reservations
  resources :maps, only: [:about]
  resources :patients, only: [:edit, :update]
  resources :admin, only: [:index]
  resources :sicks, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end