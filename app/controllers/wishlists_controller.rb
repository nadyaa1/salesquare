class WishlistsController < ApplicationController

  def index
    @wishlists = current_user.wishlists
  end

  def edit
    @wishlist = current_user.wishlists.find(params[:id])
  end

  def update
    @wishlist = current_user.wishlists.find(params[:id])

    if @wishlist.update(account_wishlist_params)
      redirect_to account_wishlists_path
      flash[:notice] = "it worked"
    else
      redirect_to root_path
      flash[:warning] = "it didn't work"
    end
  end

  def destroy
    @wishlist = current_user.wishlists.find(params[:id])
    @wishlist.destroy
    redirect_to account_wishlists_path
  end

  private

  def account_wishlist_params
    params.require(:wishlist).permit(:name)
  end

end
