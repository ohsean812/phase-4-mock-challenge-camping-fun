class CampersController < ApplicationController

    def index
        campers = Camper.all
        render json: campers, except: [:created_at, :updated_at]
    end

    def show
        camper = Camper.find_by(id:params[:id])   # Question to ask: this didn't work when using `find(params[:id])`. Why?
        if camper
            render json: camper, serializer: CamperActivitySerializer
        else
            render json: { error: "Camper not found" }, status: :not_found
        end
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

end
