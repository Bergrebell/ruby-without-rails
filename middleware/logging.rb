require 'logger'

class Logging
  attr_reader :logger

  def initialize(app)
    @app = app
    @logger = Logger.new('log/development.log')
  end

  def call(env)
    logger.info "#{env['REQUEST_METHOD']}: #{env['REQUEST_PATH']}"
    @app.call(env)  # call the next middleware or our application
  rescue => e
    logger.error("Oops, something went wrong. Error: #{e.message}")
    [500, { 'Content-Type' => 'text/html' }, ["Error: #{e.message}"]]
  end
end
