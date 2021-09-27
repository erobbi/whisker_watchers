class CatsController < ApplicationController

    def index
        cats = Cat.all
        render json: cats, status: :ok
    end

    def bcscalculator
        bcs = params[:BCS].to_f
        cw = params[:currentWeight].to_f 

        ratioOverweight = (0.1*bcs - 0.5)
        percentOverweight = (ratioOverweight*100).to_i;
        if percentOverweight < 0 
            warning = true
        else
            warning = false
        end
        if bsc > 5
            suggestedIdealWeight = (cw - (cw * ratioOverweight)).round(3)
        end
        rer = ((BCS)/2.2)**0.75
        rer = (rer * 70).to_i
        if bsc < 6
            if isNuetered = true
                suggestedCalories = rer * 1.0
            elsif isNuetered = false
                    suggestedCalories = rer * 1.2
            end
        elsif bsc >= 6
            suggestedCalories = rer * 0.8
        end

        if bsc.between?(6,8)
            message = "Your cat is #{percentOverweight}% overweight!\nSuggested ideal weight is #{suggestedIdealWeight} pounds"
        elsif bsc >= 8
            message = "Your cat is obese!\nYour cat is #{percentOverweight}% over ideal weight.\nSuggested ideal weight is #{suggestedIdealWeight} pounds"
        elsif bsc.between?(4,5)
            message = "Your cat is a perfect weight!"
        elsif bsc < 4
            message = "Your cat is underweight."
        else
            message = "Error."
        end

        bodyFat = params[:currentWeight] * (100)

        messageSuggestion = "no"

        render json: [percentOverWeight: percentOverweight, warning: warning, suggestedCalories: suggestedCalories, message: message], status: :accepted
    end

end
