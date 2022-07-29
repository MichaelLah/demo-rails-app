class ArticlesController < ApplicationController
  def index
    @pagy, @records = pagy(Article.all)
  end
end
