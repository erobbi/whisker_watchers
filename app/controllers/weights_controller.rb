class WeightsController < ApplicationController
    skip_before_action :authorize

    def create
        weight = Weight.create!(weight_params)
        render json: weight, status: :created
    end

    private

    def weight_params
        permitted = params.permit(:cat_id, :weight)
    end
end
