Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope controller: :pages do
    root action: 'front_page'
    get 'find', to: redirect('/retailers')
    get 'retailers'
    get 'about'
    get 'success'
  end

  resource :contact, only: [:show, :create]
  resolve('Contact') { [:contact] }

  resource :replacement, only: [:show, :create]
  resolve('Replacement') { [:replacement] }
  # todo: add a route to support rendering email for testing?

  scope 'contact' do
    get '/replacement', to: redirect('/replacement')
  end

  get 'select_category' => redirect('/')
  get 'select_collection' => redirect('/')

  resources :items, only: [:index, :show], param: 'itemno', path: 'products'

  match '*path' => 'pages#handle_404', via: [:get, :post]
end
