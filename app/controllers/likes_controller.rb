class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product

  # POST /products/:product_id/likes
  def create
    like = @product.likes.find_or_initialize_by(user: current_user)
    if like.persisted?
      redirect_to product_path(@product), notice: 'Already liked.'
    elsif like.save
      redirect_to product_path(@product), notice: 'Product liked.'
    else
      redirect_to product_path(@product), alert: like.errors.full_messages.to_sentence
    end
  end

  # DELETE /products/:product_id/likes/:id
  def destroy
    like = @product.likes.find(params[:id])
    if like.user == current_user
      like.destroy
      redirect_to product_path(@product), notice: 'Like removed.'
    else
      redirect_to product_path(@product), alert: 'Not authorized.'
    end
  end

  # Optional: toggle endpoint
  def toggle
    like = @product.likes.find_by(user: current_user)
    if like
      like.destroy
      redirect_to product_path(@product), notice: 'Like removed.'
    else
      @product.likes.create(user: current_user)
      redirect_to product_path(@product), notice: 'Product liked.'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end
end
