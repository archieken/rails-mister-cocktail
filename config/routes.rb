Rails.application.routes.draw do
    resources :cocktails, only: [:index,:show,:new,:create] do
      resources :doses, only: [:new, :create]
    end
    resources :doses, only: [:destroy]
end



#GET index
#     assigns all cocktails as @cocktails (FAILED - 1)
#   GET show
#     assigns the requested cocktail as @cocktail (FAILED - 2)
#   GET new
#     assigns a new cocktail as @cocktail (FAILED - 3)
#   POST create

