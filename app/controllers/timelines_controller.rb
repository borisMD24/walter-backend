class TimelinesController < ApplicationController
  before_action :set_timeline, only: [:show, :update, :destroy]

  # GET /timelines
  def index
    @timelines = Timeline.all

    render json: @timelines
  end

  # GET /timelines/1
  def show
    render json: @timeline
  end

  # POST /timelines
  def create
    @timeline = Timeline.new(timeline_params)

    if @timeline.save
      render json: @timeline, status: :created, location: @timeline
    else
      render json: @timeline.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /timelines/1
  def update
    if @timeline.update(timeline_params)
      render json: @timeline
    else
      render json: @timeline.errors, status: :unprocessable_entity
    end
  end

  # DELETE /timelines/1
  def destroy
    @timeline.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timeline
      @timeline = Timeline.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def timeline_params
      params.fetch(:timeline, {})
    end
end
