class Admin::CategoriesController < AdminsController
  expose :categories, -> { Category.all.order(created_at: :desc).page(params[:page]) }
  expose :category

  def create
    return redirect_to admin_categories_path if category.update(category_params)
    render :new
  end

  def update
    create
  end

  def destroy
    category.destroy
    redirect_to admin_categories_url
  end

  private

  def category_params
    params.require(:category).permit!
  end
end
