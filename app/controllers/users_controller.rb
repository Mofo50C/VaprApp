class UsersController < ApplicationController
    before_action :check_user_logged_in!, only: [:edit, :update, :show]

    def new
        @user = User.new
    end

    def create
        # @user = User.new(new_user_params)
        # if @user.save
        #     session[:user_id] = @user.id
        #     flash[:notice] = "Account created"
        #     redirect_to root_path
        # else
        #     flash.now[:alert] = "Exception during save, check model errors"
        #     render "new"
        # end
    end

    def show
    end

    def edit
    end

    def update
        # if Current.user.update(update_params)
        #     flash[:notice] = "Account setting saved"
        #     redirect_to current_user_path
        # else
        #     render "edit"
        # end
    end

    private
    
    def new_user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def update_params
    end

end