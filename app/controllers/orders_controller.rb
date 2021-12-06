class OrdersController < ApplicationController
    before_action :authenticated?

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
                flash.now[:alert] = "Invalid order"
                render "new" and return
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

end