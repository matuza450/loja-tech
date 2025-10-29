class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to product_path(@product), notice: 'Comment added.'
    else
      redirect_to product_path(@product), alert: @comment.errors.full_messages.to_sentence
    end
  end

  def destroy
    if @comment.user == current_user
      @comment.destroy
      redirect_to product_path(@product), notice: 'Comment removed.'
    else
      redirect_to product_path(@product), alert: 'Not authorized.'
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_comment
    @comment = @product.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
