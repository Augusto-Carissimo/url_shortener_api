Rails.application.routes.draw do
  get '/*url', to: 'links#index'
  root to: 'links#index'
end
