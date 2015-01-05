Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  scope controller: :pages do
    root action: 'front_page'
    get 'find'
    get 'success'
  end

  resource :contact, :only => :create do
    get action: 'new'
  end

  get 'select_category' => "select#category"
  get 'select_collection' => "select#collection"

  resources :items, :only => [:index, :show], param: 'itemno', path: 'products'

end
