class OrderInstancesController < ApplicationController
  before_action :set_order_instance, only: [:show, :update, :destroy]

  # GET /order_instances
  def index
    @order_instances = OrderInstance.all

    render json: @order_instances
  end

  # GET /order_instances/1
  def show
    render json: @order_instance
  end

  # POST /order_instances
  def create
    @order_instance = OrderInstance.new(order_instance_params)

    if @order_instance.save
      render json: @order_instance, status: :created, location: @order_instance
    else
      render json: @order_instance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_instances/1
  def update
    if @order_instance.update(order_instance_params)
      render json: @order_instance
    else
      render json: @order_instance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_instances/1
  def destroy
    @order_instance.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_instance
      @order_instance = OrderInstance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_instance_params
      params.fetch(:order_instance, {})
    end
end
