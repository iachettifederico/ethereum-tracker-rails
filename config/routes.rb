Rails.application.routes.draw do
  defaults format: :json do
    resource :track, only: [:create]
    resources :status, only: [:show], param: :address
  end

  if Rails.env.development?
    root to: "home#show"
    resource :deposit, only: [:create]
    resource :deduct, only: [:create]
    resource :update, only: [:create]
  end
end
