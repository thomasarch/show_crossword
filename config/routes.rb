Rails.application.routes.draw do
  get '/doubleword', to: redirect('/doubleword')

  get "/pages/:page" => "pages#show" 

  get 'weave_eight/show'
  get 'weave_five/show'
  get 'weave_four/show'
  get 'get_words/fetch'
  
  get 'four/:letter', to: 'weave_four#show'
  get 'five/:letter', to: 'weave_five#show'
  get 'eight/:letter', to: 'weave_eight#show'

  get 'weaver/search/:letter', to: 'weaver#search'
  get 'weaver/split'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
