class WeightsController < ApplicationController
    skip_before_action :authorize

    def create
        weight = Weight.create!(weight_params)
        render json: weight, status: :created
    end

    def show
        entry = Weight.find_by(id: params[:id])
        render json: entry, status: :ok
    end

    def update
        entry = Weight.find(weight_params[:id])
        entry.update!(weight_params)
        render json: entry, status: :accepted
    end

    def destroy
        entry = Weight.find(weight_params[:id])
        entry.destroy
        head :no_content, status: :deleted
    end

    private

    def weight_params
        permitted = params.permit(:id, :cat_id, :weight)
    end
end
