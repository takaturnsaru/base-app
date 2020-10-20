class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.valid?
      @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  private

  def product_params
    params.permit(:name,:grade_id,:price).merge(admin_id:current_admin.id)
  end
end
