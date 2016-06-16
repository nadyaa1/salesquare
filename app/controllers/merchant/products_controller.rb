class Merchant::ProductsController < ApplicationController
  include DeviseCreateUsers::MerchantsHelper
  before_action :check_merchant, only:[ :new, :create, :edit, :update, :destroy ]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:name, :description, :photo, :photo_cache, :price, :url))
    @product.save!
    redirect_to product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(params.require(:product).permit(:name, :description, :photo, :photo_cache, :price, :url))
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to merchant_products_path
  end
end
