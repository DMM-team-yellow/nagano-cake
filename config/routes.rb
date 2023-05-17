Rails.application.routes.draw do
  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/crate'
    get 'addresses/update'
    get 'addresses/destroy'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  devise_for :customers,skip: [:passwords],controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  devise_for :admin,skip: [:registrations, :passwords],controllers: {
  sessions: "admin/sessions"
}

  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
