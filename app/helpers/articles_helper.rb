module ArticlesHelper
  def short_text(article)
    article.body.truncate(264)
  end
end
