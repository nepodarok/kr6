class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :index]

  def index
    redirect_to root_path
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Объявление успешно размещено"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    authorize! :update, Product
    @product = Product.find(params[:id])
  end

  def edit
    authorize! :update, @product
    @product = Product.find(params[:id])
    # if current_user.id != @product.user_id
    #   flash[:success] = "Недостаточно прав"
    #   redirect_to root_path
    # end
  end

  def destroy
    @product = Product.find(params[:id])
    if current_user.id != @product.user_id
      flash[:success] = "Недостаточно прав"
      redirect_to root_path
    end
    Product.find(params[:id]).destroy
    flash[:success] = "Продукт успешно удален!"
    redirect_to root_path
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:success] = "Продукт отредактирован"
      redirect_to root_path
    else
      render 'edit'
    end
  end




        private

          def product_params
            params.require(:product).permit(:name, :user_id, :category_id, :contacts, :content)
          end
end
