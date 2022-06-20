class PlantsController < ApplicationController
  def index
    render json: Plant.all
  end

  def show
    plant = Plant.find(params[:id])
    if plant
      render json: plant
    else
      render json:{error: "Plant not found"}, status: :not_found
    end
  end

  def create
    plant = Plant.create(plant_params)
    if plant.valid?
      render json: plant, status: :created
    else
      render json: {error: plant.errors.full_messages}, status: :unprocessable_entity
    end
  end

  private
  def plant_params
    params.permit(:name, :image, :price)
  end
end
