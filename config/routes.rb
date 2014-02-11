Tunr::Application.routes.draw do
  resources :artists, except: :destroy do
    resources :songs, only: [:new, :edit, :create]
  end
end
