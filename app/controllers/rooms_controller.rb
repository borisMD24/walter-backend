class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]
  include RoomsHelper
  # GET /rooms
  def index
    @rooms = Room.all.map do |room|
      room.render
    end

    render json: @rooms
  end

  # GET /rooms/1
  def show
    render json: @room.render
  end

  # POST /rooms
  def create
    @room = Room.new(room_params)

    if @room.save
      render json: @room, status: :created, location: @room
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    interpretor(room_params)
    if @room.update(room_params)
      render json: @room.render
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:instruction, :name)
    end
end
