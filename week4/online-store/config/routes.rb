Rails.application.routes.draw do
get 'welcome/index'
root 'welcome#index'
get 'brands/count' => 'brands#count'
resources :brands
resources :products
resources :categories


  
end
