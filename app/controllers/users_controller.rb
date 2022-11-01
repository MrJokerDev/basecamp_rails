class UsersController < ApplicationController
    before_action :authenticate_user!

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new user_params
        if @user.save
            redirect_to users_path, notice: 'User in successfully create'
        else
            flash.now[:alert] = 'Invalid create User'
            render :new
        end
    end

    def edit 
        @user = User.find_by id: params[:id]
    end

    def update
        @user = User.find_by id: params[:id]
        puts @user
        if @user.update user_params
            redirect_to users_path, notice: 'User in successfully update' 
        else
            flash.now[:alert] = 'Invalid update User'
            render :edit
        end
    end


    def destroy
        @user = User.find_by id: params[:id]
        puts @user
        if @user.delete
            flash.now[:notice] = 'User in successfully destroy'
            redirect_to users_path
        else
            flash.now[:alert] = 'Invalid delete User'
            render :index
        end
    end

    private

    def user_params
        params.require(:user).permit(:role)
    end
end