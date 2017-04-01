class CategoriesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :index]
  before_action :check_admin, only: [:new, :create, :edit, :destroy, :index]

  def index
      @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @products = Product.where(category_id: @category.id)
  end

  def edit
    authorize! :manage, :all
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.products.count == 0
      Category.find(params[:id]).destroy
      flash[:success] = "Категория удалена!"
      redirect_to categories_path
    else
      flash[:success] = "Эту категорию нельзя удалить"
      redirect_to categories_path
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Категория отредактирована!"
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Категория создана!"
      redirect_to categories_path
    else
      render 'new'
    end
  end


      private

        def check_admin
          unless current_user.admin == true
            flash[:success] = "недостаточно прав"
            redirect_to root_path
          end
        end

        def category_params
          params.require(:category).permit(:name)
        end

end
