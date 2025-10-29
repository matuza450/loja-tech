class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  # GET /products or /products.json
  def index
    @products = Product.all
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    # Build without images first; we'll attach files explicitly to avoid param issues
    images = product_params.delete(:images) if product_params[:images]
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        # Attach any uploaded images explicitly
        @product.images.attach(images) if images.present?
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      # If new images uploaded, attach them explicitly instead of relying solely on update
      images = product_params.delete(:images) if product_params[:images]
      if @product.update(product_params)
        @product.images.attach(images) if images.present?
        format.html { redirect_to @product, notice: "Product was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy!

    respond_to do |format|
      format.html { redirect_to products_path, notice: "Product was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  # Public action to remove an image from a product (must be public for routing)
  def remove_image
    image = @product.images.find(params[:image_id])
    image.purge
    redirect_back(fallback_location: edit_product_path(@product), notice: 'Image was successfully removed.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params

      params.require(:product).permit(:name, :description, :price, :stock, images: [])

    end
end
