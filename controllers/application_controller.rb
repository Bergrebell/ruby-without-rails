require 'erb'

class ApplicationController
  attr_reader :env

  def initialize(env)
    @env = env
  end

  # Read the view + store the controller bindings and hand them to the result-method from ERB
  def render(view_template)
    erb_template = ERB.new File.read(view_template)
    erb_template.result(get_binding)
  end

  # Store all instance variables (and more) of the current scope in the bindings-object
  def get_binding
    binding
  end
end
