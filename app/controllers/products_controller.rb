class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only:[ :index, :show ]

  def index
    if params[:gender] == "0"
      @products = Product.where(gender: 0)
    elsif params[:gender] == "1"
      @products = Product.where(gender: 1)
    elsif params[:gender] == "2"
      @products = Product.where(gender: 2)
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
  end
end
