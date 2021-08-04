class ThemeLightsController < ApplicationController
  before_action :set_theme_light, only: [:show, :update, :destroy]

  # GET /theme_lights
  def index
    @theme_lights = ThemeLight.all

    render json: @theme_lights
  end

  # GET /theme_lights/1
  def show
    render json: @theme_light
  end

  # POST /theme_lights
  def create
    @theme_light = ThemeLight.new(theme_light_params)

    if @theme_light.save
      render json: @theme_light, status: :created, location: @theme_light
    else
      render json: @theme_light.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /theme_lights/1
  def update
    if @theme_light.update(theme_light_params)
      render json: @theme_light
    else
      render json: @theme_light.errors, status: :unprocessable_entity
    end
  end

  # DELETE /theme_lights/1
  def destroy
    @theme_light.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme_light
      @theme_light = ThemeLight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def theme_light_params
      params.fetch(:theme_light, {})
    end
end
