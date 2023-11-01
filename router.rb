require 'singleton'
require 'debug'
require_relative 'controllers/articles_controller'

class Router
  include Singleton

  attr_reader :routes

  class << self
    # Accepts a block and executes that block in the context of the instance of the Router class
    # (that's what instance_exec does)
    #
    # eg. get('/') {"Romans ruby blog"} which gets set in the routes file
    def draw(&blk)
      Router.instance.instance_exec(&blk)
    end
  end

  def initialize
    @routes = {}
  end

  def get(path, &blk)
    if blk
      @routes[path] = blk
    else
      if path.include? '/'
        controller, action = path.split('/')
        controller_klass_name = controller.capitalize + 'Controller'
        controller_klass = Object.const_get(controller_klass_name)

        @routes[path.prepend('/')] = ->(env) {
          controller_klass.new(env).send(action.to_sym)
        }
      end
    end
  end

  def build_response(env)
    path = env['REQUEST_PATH']
    handler = @routes[path] || ->(env) { "no route found for #{path}" }
    handler.call(env) # calls the lambda function from the routes hash
  end
end
