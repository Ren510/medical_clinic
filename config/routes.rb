Rails.application.routes.draw do
  
  get 'patients/show'
  get 'patients/edit'
  get 'patients/update'
  # ユーザー側のデバイス
  devise_for :patients
  root 'homes#top'
  get 'about' => "homes#about"
  resources :maps, only: [:about]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
