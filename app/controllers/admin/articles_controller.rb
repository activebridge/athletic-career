class Admin::ArticlesController < AdminsController
  expose :articles, -> { Article.all }
  expose :show_article, -> { Article.friendly.find(params[:id]) }
  expose :article

  def create
    return redirect_to admin_articles_path if article.save
    render :new
  end

  def update
    return redirect_to admin_articles_path if show_article.update(article_params)
    render :edit
  end

  def destroy
    show_article.destroy
    redirect_to admin_articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  def article_params
    params.require(:article).permit!
  end
end
