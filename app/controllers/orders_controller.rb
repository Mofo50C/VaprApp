class OrdersController < ApplicationController
    before_action :authenticated?
    before_action :check_cart!, except: :index

    def index
        @orders = Order.where(user: current_user).order(:created_at)
    end

    def new
        @total_checkout = get_total
    end

    def create
        @current_orders = []
        current_cart.games.each do |game|
            order = Order.new(user: current_user, game: game, total: game.calculate_price)
            if !order.valid?
                flash[:alert] = "Invalid order"
                redirect_to current_cart_path
                return
            end
            @current_orders << order
        end

        @current_orders.each {|order| order.save}
        @order_total = get_total
        current_cart.games.clear
        render "show"
    end

    private
    def get_total
        total = 0
        current_cart.games.each {|game| total += game.calculate_price}
        return total
    end

    def check_cart!
        if !current_cart || current_cart.games.empty?
            redirect_to root_path
        end
    end

end