class CategoriesController < ApplicationController
  before_action :require_admin, only: [:edit]
  before_action :set_category, only: [:edit, :update]

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
    @category = Category.new(category_params)
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

  private
  def category_params
    params.require(:category).permit(:name, :transaction_type, :order)
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