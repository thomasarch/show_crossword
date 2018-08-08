Rails.application.routes.draw do
  get 'weave_four/show'
  get 'get_words/fetch'
  
  get 'four/:letter', to: 'weave_four#show'

  get 'weaver/search/:letter', to: 'weaver#search'
  get 'weaver/split'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
