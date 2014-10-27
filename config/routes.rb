Rails.application.routes.draw do

  resources :events

  root 'welcome#index'
  get "/events" => "events#index"

end
