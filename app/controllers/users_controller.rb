class UsersController < ApplicationController
    skip_before_action :authorize, only: :create
    
    def index
        users = User.all
        render json: users, status: :ok
    end

    def show
        render json: @current_user
    end

    # patch has to be sent to an instance (user/{user_id), but this will always default the patch to that of current_user
    def update
        @current_user.update!(user_params)
        render json: @current_user, status: :accepted
    end

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    private
    def user_params
        params.permit(:name, :username, :avatar_url, :password, :password_confirmation)
    end  
end
