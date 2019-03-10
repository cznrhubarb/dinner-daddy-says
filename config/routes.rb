Rails.application.routes.draw do
  root 'welcome#index'

  match '/phrases' => 'phrases#random', via: :post
end
