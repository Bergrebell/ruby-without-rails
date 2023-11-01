require 'erb'
require_relative './router'

class App
  attr_reader :router

  def initialize
    @router = Router.new

    router.get('/') {"Romans ruby blog"}
    router.get('/articles') {"All articles"}
    router.get('/articles/1') {"First article"}
  end

  def call(env)
    headers = { 'Content-Type' => 'text/html' }

    response_html = router.build_response(env['REQUEST_PATH'])

    # same response, i.e. contents of index.html
    # is sent no matter the request
    [200, headers, [response_html]]
  end

  def html_template
    File.read 'views/index.html.erb'
  end
end
