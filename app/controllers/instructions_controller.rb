class InstructionsController < ApplicationController
    include InstructionsHelper
    ActionController::Parameters.permit_all_parameters = true
    def create
        p "sssssssssssssssssssssssssssssssssssss"
        p "sssssssssssssssssssssssssssssssssssss"
        p "sssssssssssssssssssssssssssssssssssss"
        p "sssssssssssssssssssssssssssssssssssss"
        p "sssssssssssssssssssssssssssssssssssss"

        h = params
        p h.to_hash
        render json: interpretor(h)
    end
end 