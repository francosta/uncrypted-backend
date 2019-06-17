class UsersController < ApplicationController
    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(params[:id])
        render json: user
    end

    def destroy
        user = User.find_by(params[:id])
        user.destroy
    end

    def create
        user = User.create(user_params)
        render json: user
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        render json: user 
    end

    private

    def user_params 
        params.require(:user).permit(:id, :name, :email, :password_digest, :profile_picture)
    end
end