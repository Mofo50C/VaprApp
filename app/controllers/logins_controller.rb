class LoginsController < ApplicationController
    before_action :checked_logged_in!, only: [:new, :create]

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
        if !current_user
            redirect_to root_path
            return
        end

        if current_cart
            current_cart.destroy
            session[:cart_id] = nil
        end
        session[:user_id] = nil
        flash[:logged_out] = "Logged out"
        redirect_to root_path
    end
end