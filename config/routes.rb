require_relative '../router'

Router.draw do
  get('/') {"Romans ruby blog"}
  get('/foo') {"fooohuuu"}
  get('/articles') { 'All Articles' }
  get('/articles/1') { "First Article" }
end
