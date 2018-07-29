Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'items#index' #die neue startseite ist die index.html
  resources :items do
    member do
      patch :complete
    end
  end
end
