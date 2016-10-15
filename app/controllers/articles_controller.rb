class ArticlesController < ApplicationController
  expose :articles, -> { Article.all }
  expose :article
end
