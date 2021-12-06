class CartController < ApplicationController

    before_action :authenticated?

    def show
    end

    def create
        game = Game.find(params[:id])

        if !current_cart.games.exists?(game.id)
            current_cart.games << game
            redirect_to current_cart_path
        else
            redirect_back(fallback_location: root_path)
        end

    end

    def update
        game = Game.find(params[:id])

        if current_cart.games.exists?(game.id)
            current_cart.games.delete(game)
        end

        redirect_to current_cart_path
    end

end