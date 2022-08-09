class PlantsController < ApplicationController
    def index
        plants= Plant.all
        render json: plants
    end

    def show
        id= params[:id]
        plants= Plant.find_by(id:id)
        if plants
        render json: plants
        else 
        render json: {error: "plant not found"}, status: not_found
        end
    end

    def create 
        plants= Plant.create(plant_params)
        render json: plants, status: :created
    end
    
    private

    def plant_params
        params.permit(:name, :image, :price)
    end

end
