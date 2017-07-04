class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: [:update, :destroy]

  def index
    @categories = Category.all.page(params[:page]).per(10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Категория создана!'
    else
      render :create
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: 'Категория изменена.'
    else
      render :update
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: 'Категория удалена.'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :weight, :code)
  end

end