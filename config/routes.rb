Tunr::Application.routes.draw do
  resources :artists do
    resources :songs, except: [:index, :show]
  end
end