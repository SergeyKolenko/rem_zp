class Admin::CategoriesController < Admin::AdminController
  before_action :set_category, only: [:update, :destroy]

  def index
    @categories = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 3)
  end

  def new
    @category = Category.new
  end

  def edit
    # if set_category
    #   redirect_to 'update'
    # else
    #   render :update
    # end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: 'Категория создана!'
    else
      render :new
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
    redirect_to admin_categories_path, notice: 'category was successfully destroyed.'
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :weight)
  end

end