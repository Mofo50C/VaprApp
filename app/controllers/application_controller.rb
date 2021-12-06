class ApplicationController < ActionController::Base
    helper_method :current_user, :current_cart

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def current_cart
        if current_user
            begin
                return Cart.find(session[:cart_id])
            rescue ActiveRecord::RecordNotFound
                cart = Cart.create
                session[:cart_id] = cart.id
                return cart
            end
        end
    end

    private

    def authenticated?
        if !current_user
            flash[:login_required] = "Please login first"
            redirect_to login_path
        end
    end

end
