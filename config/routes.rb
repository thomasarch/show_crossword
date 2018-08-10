Rails.application.routes.draw do
  get 'answer/show'

  get "/pages/:page" => "pages#show"

  get 'answer/:letter/:number', to: 'answer#show'

  get 'get_words/fetch'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
