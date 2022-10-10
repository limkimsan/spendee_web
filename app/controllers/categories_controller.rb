class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "New category is created!"
      redirect_to categories_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :transaction_type, :order)
  end
end