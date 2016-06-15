class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only:[ :index, :show ]

  def index
    if params[:gender] == "men"
      @products = Product.where(category: men)
    elsif params[:gender] == "women"
      @products = Product.where(category: women)
    elsif params[:gender] == "kids"
      @products = Product.where(category: kids)
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
  end
end
