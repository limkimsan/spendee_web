class CategoriesController < ApplicationController
  before_action :require_admin, only: [:edit, :destroy]
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    authorize User
    @categories = Category.all
  end

  def new
    authorize User
    @category = Category.new
  end

  def create
    authorize User
    cate_params = category_params;
    if category_params[:order] == ""
      cate_params[:order] = Category.last ? Category.last.order + 1 : 1;
    end

    @category = Category.new(cate_params)
    if @category.save
      flash[:success] = "New category is created!"
      redirect_to categories_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    authorize User
    if @category.update(category_params)
      flash[:success] = "The category was successfully updated"
      redirect_to categories_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path
  end

  private
  def category_params
    params.require(:category).permit(:name, :name_km, :transaction_type, :order, :icon, :icon_type, :icon_color, :bg_color)
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def require_admin
    if !current_user.primary_admin? && !current_user.admin?
      redirect_to root_path
    end
  end
end