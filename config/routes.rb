Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:new, :create]
    # resources :images, only: [:destroy]

  end

  resources :doses, only: [:destroy]
  # You need to aks yourself do I need a dose id to delete. True. Do I need a associate does with cocktail
  #   to delete a dose?False. Thats why its outside the scope
  root to: "cocktails#index"
end
