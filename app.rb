class App
  def call(env)
    headers = {
      'Content-Type' => 'text/html'
    }

    response = ['<h1>Hello Ruby?!!</h1>']

    [200, headers, response]
  end
end
