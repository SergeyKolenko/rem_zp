class Admin::CategoriesController < Admin::AdminController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Категория создана!'
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Категория изменена.'
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to admin_users_url, notice: 'category was successfully destroyed.'
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.fetch(:category, {})
  end

end