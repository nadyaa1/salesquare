class WishlistsController < ApplicationController

  def index
    @wishlists = current_user.wishlists
  end

  def destroy
    @wishlist = current_user.wishlists.find(params[:id])
    @wishlist.destroy
    redirect_to account_wishlists_path
  end
end
