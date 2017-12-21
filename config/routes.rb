Rails.application.routes.draw do

  get 'user/new'
  get 'user/create'
  get 'user/login'
  get 'user/login_process'
  get 'user/logout'

  root 'post#index'

  get 'post/new'
  get 'post/create'
  get 'post/show/:id' => 'post#show'
  get 'post/create_reply/:id' => 'post#create_reply'
  get 'post/edit/:id' => 'post#edit'
  get 'post/update/:id' => 'post#update'
  get 'post/destroy/:id' => 'post#destroy'

end
