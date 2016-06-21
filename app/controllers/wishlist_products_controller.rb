class WishlistProductsController < ApplicationController

  def show
    @wishlists = Wishlist.all
  end

  def create
    @product = Product.find(params[:product_id])
    @wishlist_product = WishlistProduct.new(product: @product)

    if params[:new_wishlist_name].present?
      @wishlist = current_user.wishlists.where(name: params[:new_wishlist_name]).first_or_create
    else
      @wishlist = current_user.wishlists.find(wishlist_product_params[:wishlist_id])
    end

    @wishlist_product.wishlist = @wishlist
    @wishlist_product.save

    redirect_to product_path(@product)
  end



  private

  def wishlist_product_params
    params.require(:wishlist_product).permit(:wishlist_id)
  end
end
