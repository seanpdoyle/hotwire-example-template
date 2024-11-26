class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :set_variant, only: %i[ new edit update create ]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    request.variant = @variant
    @product = Product.new
  end

  def edit
    request.variant = @variant
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path, notice: "Product was successfully created."
    else
      render :new, variants: @variant, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "Product was successfully updated."
    else
      render :edit, variants: @variant, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy!

    redirect_to products_path, status: :see_other, notice: "Product was successfully destroyed."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description)
  end

  def set_variant
    @variant ||= :drawer if params[:variant] == "drawer"
  end
end
