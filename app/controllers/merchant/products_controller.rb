class Merchant::ProductsController < ApplicationController
  include DeviseCreateUsers::MerchantsHelper
  before_action :check_merchant, only:[ :new, :create, :edit, :update, :destroy ]

  def index
    @products = current_user.products
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
<<<<<<< HEAD
    @product = Product.new(params.require(:product).permit(:name, :description, :photo, :photo_cache, :price, :url))
=======
    @product = Product.new(params.require(:product).permit(:name, :description, :category, :price, :url))
    @product.user = current_user
>>>>>>> 80b3884491f8b03bbc17dbfad793d2dfca3cc2c1
    @product.save!
    redirect_to product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
<<<<<<< HEAD
    @product.update(params.require(:product).permit(:name, :description, :photo, :photo_cache, :price, :url))
=======
    @product.update(params.require(:product).permit(:name, :description, :category, :price, :url))
>>>>>>> 80b3884491f8b03bbc17dbfad793d2dfca3cc2c1
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to merchant_products_path
  end
end
