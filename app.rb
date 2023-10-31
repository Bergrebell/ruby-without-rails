require 'erb'

class App
  def call(env)
    headers = { 'Content-Type' => 'text/html' }

    title = "Roman"
    erb = ERB.new(html_template)
    response_html = erb.result(binding)

    # same response, i.e. contents of index.html
    # is sent no matter the request
    [200, headers, [response_html]]
  end

  def html_template
    File.read 'views/index.html.erb'
  end
end
