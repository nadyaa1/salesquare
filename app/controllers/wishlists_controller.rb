class WishlistsController < ApplicationController

  def index
    @wishlists = current_user.wishlists
  end

  def destroy
    @wishlist_product = WishlistProduct.find(params[:id])
    @wishlist_product.destroy
    redirect_to account_wishlists_path
  end

end
