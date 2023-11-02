class ArticlesController < ApplicationController
  def index
    @title = 'Coming from a variable in the controller, baby!'
    @article = Article.new("There is no Rails", "just plain ruby with some gems.")
  end
end
