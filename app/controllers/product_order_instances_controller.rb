class ProductOrderInstancesController < ApplicationController
  before_action :set_product_order_instance, only: [:show, :update, :destroy]

  # GET /product_order_instances
  def index
    @product_order_instances = ProductOrderInstance.all

    render json: @product_order_instances
  end

  # GET /product_order_instances/1
  def show
    render json: @product_order_instance
  end

  # POST /product_order_instances
  def create
    @product_order_instance = ProductOrderInstance.new(product_order_instance_params)

    if @product_order_instance.save
      render json: @product_order_instance, status: :created, location: @product_order_instance
    else
      render json: @product_order_instance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_order_instances/1
  def update
    if @product_order_instance.update(product_order_instance_params)
      render json: @product_order_instance
    else
      render json: @product_order_instance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_order_instances/1
  def destroy
    @product_order_instance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_order_instance
      @product_order_instance = ProductOrderInstance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_order_instance_params
      params.fetch(:product_order_instance, {})
    end
end
