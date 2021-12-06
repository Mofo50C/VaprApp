class UsersController < ApplicationController
    before_action :checked_logged_in!

    def new
        @user = User.new
    end

    def create
        @user = User.new(new_user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:account_created] = "Account created"
            redirect_to root_path
        else
            flash.now[:alert] = "User could not be added"
            render "new"
        end
    end

    private
    
    def new_user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

end