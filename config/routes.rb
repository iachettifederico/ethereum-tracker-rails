Rails.application.routes.draw do
  defaults format: :json do
    resource :track, only: [:create]
    resources :status, only: [:show], param: :address
  end
end
