require 'uri'
class ProductsController < ApplicationController
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end
  
  def update
  end

  def edit
  end

  def delete
  end

  private
  def product_params
    params.require(:product).permit(:title_name, :title_description, :title_price, :image)
  end
end
