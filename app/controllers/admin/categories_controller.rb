class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: [:update, :destroy]

  def index
    @categories = Category.all.page(params[:page]).per(10)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = t('admin.categories.create_notice')
    else
      flash[:danger] = @category.errors.full_messages
    end
    redirect_to admin_categories_path
  end

  def update
    if @category.update(category_params)
      flash[:success] = t('admin.categories.update_notice')
    else
      flash[:danger] = @category.errors.full_messages
    end
    redirect_to admin_categories_path
  end

  def destroy
    if @category.destroy
      flash[:success] = t('admin.categories.destroy_notice')
    else
      flash[:danger] = @category.errors.full_messages
    end
    redirect_to admin_categories_path
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :weight, :code)
  end

end