class CatsController < ApplicationController

    def index
        cats = Cat.all
        render json: cats, status: :ok
    end

    def show
        cat = Cat.find_by(id: params[:id])
        render json: cat, status: :ok
    end

    def create
        cat = @current_user.cats.create!(cat_params)
        render json: cat, status: :created
    end

    def bcscalculator
        bcs = params[:BCS].to_f
        cw = params[:currentWeight].to_f 
        isNuetered = params[:isNuetered]

        ratioOverweight = (0.1*bcs - 0.5)
        percentOverweight = (ratioOverweight*100).to_i;
        if percentOverweight < 0 
            warning = true
        else
            warning = false
        end
        if bcs > 5
            suggestedIdealWeight = (cw - (cw * ratioOverweight)).round(3)
        end
        rer = ((bcs)/2.2)**0.75
        rer = (rer * 70).to_i
        if bcs < 6
            if isNuetered = "true"
                suggestedCalories = rer * 1.0
            elsif isNuetered = "false"
                suggestedCalories = rer * 1.2
            end
        elsif bcs >= 6
            suggestedCalories = rer * 0.8
        end

        if bcs.between?(6,8)
            message = "Your cat is #{percentOverweight}% overweight!\nSuggested ideal weight is #{suggestedIdealWeight} pounds"
        elsif bcs >= 8
            message = "Your cat is obese!\nYour cat is #{percentOverweight}% over ideal weight.\nSuggested ideal weight is #{suggestedIdealWeight} pounds"
        elsif bcs.between?(4,5)
            message = "Your cat is a perfect weight!"
        elsif bcs < 4
            message = "Your cat is underweight."
        else
            message = "Error."
        end

        bodyFat = params[:currentWeight] * (100)

        messageCalories = "Suggested intake is #{suggestedCalories} Calories per day."

        render json: [percentOverWeight: percentOverweight, warning: warning, suggestedCalories: suggestedCalories, message: message, messageCalories: messageCalories], status: :accepted
    end

    private

    def cat_params
        params.permit(:name, :age, :id)
    end
end
