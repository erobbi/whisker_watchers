class WeightsController < ApplicationController
    skip_before_action :authorize

    def create
        cat = Cat.find(params[:cat_id])
        weight = cat.weights.create!(weight_params)
        render json: weight, status: :created
    end

    private

    def weight_params
        params.permit(:cat_id, :user_id, :weight)
    end
end
