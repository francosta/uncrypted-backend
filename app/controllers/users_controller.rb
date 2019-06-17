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

    private

    def user_params 
        params.require(:user).permit(:id, :name, :email, :password_digest, :profile_picture)
    end
end