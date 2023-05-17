Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}

  namespace :public do
    resources :homes, only[:top,:about]
    resources :items, only[:index,:show]
    resources :customers, only[:show,:edit,:update]
    resources :cart_items, only[:index,:update,:destroy,:destroy_all,:create]
    resources :orders, only[:new,:index,:show,:create]
    resources :addresses, only[:index,:edit,:create,:update,:destroy]
  end
  
  namespace :admin do
    resources :homes, only[:top]
    resources :items, only[:new,:index,:show,:create,:edit,:update]
    resources :genres, only[:index,:create,:edit,:update]
    resources :customers, only[:index,:show,:edit,:update]
    resources :orders, only[:show,:update]
    resources :order_items, only[:update]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
