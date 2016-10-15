class Admin::ArticlesController < AdminsController
  expose :articles, -> { Article.all }
  expose :article

  def create
    return redirect_to admin_articles_path if article.update(article_params)
    render :new
  end

  def update
    create
  end

  def destroy
    article.destroy
    redirect_to admin_articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def article_params
    params.require(:article).permit!
  end
end
