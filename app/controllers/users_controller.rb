class UsersController < ApplicationController
    before_action :authenticated?, only: [:edit, :update, :show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(new_user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:register_success] = "Account created"
            redirect_to games_path
        else
            flash.now[:alert] = "User could not be added"
            render "new"
        end
    end

    def show
    end

    private
    
    def new_user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end