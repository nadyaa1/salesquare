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
    elsif @category == "blazers"
      @products = @products.where(category: "blazers")
    elsif @category == "jackets"
      @products = @products.where(category: "jackets")
    elsif @category == "jeans"
      @products = @products.where(category: "jeans")
    elsif @category == "lingerie"
      @products = @products.where(category: "lingerie")
    elsif @category == "shirts & blouses"
      @products = @products.where(category: "shirts & blouses")
    elsif @category == "skirts"
      @products = @products.where(category: "skirts")
    elsif @category == "socks & tights"
      @products = @products.where(category: "socks & tights")
    elsif @category == "baby gifts"
      @products = @products.where(category: "baby gifts")
    elsif @category == "accesories"
      @products = @products.where(category: "accesories")
    elsif @category == "jackets & coats"
      @products = @products.where(category: "coats")
    elsif @category == "hoodies & sweatshirts"
      @products = @products.where(category: "hoodies & sweatshirts")
    elsif @category == "shirts"
      @products = @products.where(category: "shirts")
    elsif @category == "cardigans & jumpsuits"
      @products = @products.where(category: "cardigans & jumpsuits")
    elsif @category == "trousers"
      @products = @products.where(category: "trousers")
    elsif @category == "shorts"
      @products = @products.where(category: "shorts")
    elsif @category == "t-shirts & vests"
      @products = @products.where(category: "t-shirts & vests")
    elsif @category == "socks"
      @products = @products.where(category: "socks")
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
