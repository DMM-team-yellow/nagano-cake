Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}


  root to: 'public/homes#top'
  namespace :public do
    get '/about' => 'public/homes#about'
    resources :items, only:[:index,:show]
    resources :customers, only:[:show,:edit,:update]
    #カート関連
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    resources :cart_items, only:[:index,:update,:destroy,:create]

    resources :orders, only:[:new,:index,:show,:create]
    resources :addresses, only:[:index,:edit,:create,:update,:destroy]
  end

  namespace :admin do
    get '/admin' => 'admin/homes#top'
    resources :items, only:[:new,:index,:show,:create,:edit,:update]
    resources :genres, only:[:index,:create,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :orders, only:[:show,:update]
    resources :order_items, only:[:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
