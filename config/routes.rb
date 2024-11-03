Rails.application.routes.draw do
  get 'links/top100', to: 'links#top100', as: 'top100'
  get '/*key', to: 'links#shortener'
  root to: 'links#shortener'
end
