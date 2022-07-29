class FastArticlesController < ApplicationController
  def index
    @pagy, @records = pagy(FastArticle.all)
  end
end
