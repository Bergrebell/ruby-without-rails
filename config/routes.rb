require_relative '../router'

Router.draw do
  get('/') {"Romans ruby blog"}
  get('/foo') {"fooohuuu"}
  get('/articles') { 'All Articles' }
  get('/articles/1') do |env|
    puts "Path: #{env['REQUEST_PATH']}"
    "First article"
  end
end
