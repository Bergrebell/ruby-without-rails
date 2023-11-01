require_relative 'application_controller'

class ArticlesController < ApplicationController
  def index
    'All articles coming from the controller, baby!'
  end
end
