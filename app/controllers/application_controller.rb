class ApplicationController < ActionController::Base

    before_action :set_user, :set_cart

    private

    def authenticated?
        if Current.user.blank?
            flash[:login_required] = "Please login first"
            redirect_to login_path
        end
    end

    def set_user
        if session[:user_id]
            Current.user = User.find_by(id: session[:user_id])
        end
    end

    def set_cart
        if Current.user.present?
            if session[:cart_id]
                cart = Cart.find_by(id: session[:cart_id])
                if cart.present?
                    Current.cart = cart
                else
                    session[:cart_id] = nil
                end
            end
    
            if session[:cart_id].blank?
                Current.cart = Cart.create
                session[:cart_id] = Current.cart.id
            end
        end
    end
end
