class ArticlesController < ApplicationController
  skip_before_action :require_user

  expose :articles, -> { Article.all }
  expose :article, -> { Article.friendly.find(params[:id]) }
end
