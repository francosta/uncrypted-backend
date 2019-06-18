class UsersController < ApplicationController
    
    def index
        users = User.all
        render json: UserSerializer.new(users).to_serialized_hash
    end


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

    def login
        user = User.find_by(email: user_params[:email])
        if user && user.authenticate(params[:password])
            render json: user
        else
            render json: {error: 'Invalid user/password combination.'}, status: 401
        end
    end

    private

    def user_params 
        params.permit(:id, :name, :email, :password, :profile_picture)
    end
end