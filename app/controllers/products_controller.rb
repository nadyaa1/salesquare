class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only:[ :index, :show ]

  def index
    @category = params[:category]
    @search_term = params[:search_term]

    if @search_term
      @products = search_results
    else
      @products = Product.all
    end

    if @category == "men"
      @products = @products.where(category: "men")
    elsif @category == "women"
      @products = @products.where(category: "women")
    elsif @category == "kids"
      @products = @products.where(category: "kids")
    elsif @category == "bags"
      @products = @products.where(category: "bags")
    elsif @category == "shoes"
      @products = @products.where(category: "shoes")
    elsif @category == "dresses"
      @products = @products.where(category: "dresses")
    elsif @category == "coats"
      @products = @products.where(category: "coats")
    end
  end

  def search_results
    Product.search(@search_term)
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
    @wishlist_product = WishlistProduct.new
    if user_signed_in?
      @wishlists = current_user.wishlists
    end
  end
end
