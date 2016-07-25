class Admin::CategoriesController < ApplicationController
  expose :categories, -> { Category.all }
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
    redirect_to admin_categories_url, notice: 'Category was successfully destroyed.'
  end

  private

  def category_params
    params.require(:category).permit!
  end
end
