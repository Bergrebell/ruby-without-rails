require_relative '../router'

Router.draw do
  get('/') {"Romans ruby blog"}

  get 'articles/index'
end
