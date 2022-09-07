class SignupsController < ApplicationController
   
    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created   # how to just display its created ID, and Name & Difficulty of Activities only? (no Time or Camper)
    rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end


    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

end
