class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to product_path(@product) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'product/show' }
        format.js  # <-- idem
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :title, :rating)
  end


end
