require_relative 'application_controller'

class ArticlesController < ApplicationController
  def index
    @title = 'Coming from a variable in the controller, baby!'
  end
end
