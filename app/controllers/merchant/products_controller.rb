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
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to merchant_products_path
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :photo,
      :photo_cache,
      :price,
      :url,
      :category
      )
  end

end
