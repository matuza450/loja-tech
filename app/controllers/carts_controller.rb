class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart

  def show
  end

  def add_item
    product = Product.find(params[:product_id])
    @cart_item = @cart.cart_items.find_or_initialize_by(product: product)
    @cart_item.quantity = @cart_item.quantity.to_i + 1
    
    if @cart_item.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_back(fallback_location: root_path, notice: 'Item added to cart.') }
      end
    else
      redirect_back(fallback_location: root_path, alert: 'Could not add item to cart.')
    end
  end

  def remove_item
    @cart_item = @cart.cart_items.find(params[:item_id])
    @cart_item.destroy
    
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_back(fallback_location: root_path, notice: 'Item removed from cart.') }
    end
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end
end