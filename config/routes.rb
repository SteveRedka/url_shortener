Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'shortened_links#new'
  resources :shortened_links, only: %i[create index link_info]
  get ':short_url', to: 'shortened_links#show', as: 'shortened_link'
end
