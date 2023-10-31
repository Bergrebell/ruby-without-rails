class App
  def call(env)
    headers = { 'Content-Type' => 'text/html' }

    response_html = File.read('views/index.html')

    # same response, i.e. contents of index.html
    # is sent no matter the request
    [200, headers, [response_html]]
  end
end
