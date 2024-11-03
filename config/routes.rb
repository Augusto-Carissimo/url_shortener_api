Rails.application.routes.draw do
  get '/*key', to: 'links#shortener'
  root to: 'links#shortener'
end
