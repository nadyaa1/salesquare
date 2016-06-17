class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only:[ :index, :show ]

  def index
    if params[:category] == "men"
      @products = Product.where(category: "men")
    elsif params[:category] == "women"
      @products = Product.where(category: "women")
    elsif params[:category] == "kids"
      @products = Product.where(category: "kids")
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
  end
end
