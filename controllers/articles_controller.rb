class ArticlesController
  attr_reader :env

  def initialize(env)
    @env = env
  end

  def index
    'All articles coming from the controller, baby!'
  end
end
