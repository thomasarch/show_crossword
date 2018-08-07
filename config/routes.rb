Rails.application.routes.draw do
  get 'get_words/fetch'
  get 'weaver/search/:letter', to: 'weaver#search'
  get 'weaver/split'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
