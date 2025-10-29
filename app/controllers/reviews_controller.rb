class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_review, only: [:destroy]

  def create
    # If user already reviewed, update it, otherwise create new
    @review = @product.reviews.find_or_initialize_by(user: current_user)
    @review.assign_attributes(review_params)

    if @review.save
      redirect_to product_path(@product), notice: 'Review saved.'
    else
      redirect_to product_path(@product), alert: @review.errors.full_messages.to_sentence
    end
  end

  def destroy
    if @review.user == current_user
      @review.destroy
      redirect_to product_path(@product), notice: 'Review removed.'
    else
      redirect_to product_path(@product), alert: 'Not authorized.'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_review
    @review = @product.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :body)
  end
end
