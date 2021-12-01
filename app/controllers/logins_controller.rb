class LoginsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(username: params[:username].downcase)

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:logged_in] = "Logged in"
            redirect_to root_path
        else
            flash.now[:alert] = "Invalid username or password"
            render "new"
        end
    end

    def destroy
        session[:user_id] = nil
        session[:cart_id] = nil
        flash[:logged_out] = "Logged out"
        redirect_to root_path
    end
end