class ApplicationController < ActionController::Base

    before_action :set_current_user

    def set_current_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def check_user_logged_in!
        if Current.user.nil?
            flash[:login_require] = "Please login first"
            redirect_to login_path
        end
    end

end
