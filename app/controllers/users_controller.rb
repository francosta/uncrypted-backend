class UsersController < ApplicationController
    
    def show
        user = User.find_by(id: params[:id])
        render json: UserSerializer.new(user).to_serialized_hash
    end

    def destroy
        user = User.find_by(id: params[:id])
        user.destroy
    end

    def create
        user = User.create(user_params)
        render json: user
    end

    def update
        user = User.find(id: params[:id])
        user.update(user_params)
        render json: user 
    end

    private

    def user_params 
        params.require(:user).permit(:id, :name, :email, :password_digest, :profile_picture)
    end
end