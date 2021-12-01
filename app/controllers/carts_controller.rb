class CartsController < ApplicationController

    before_action :authenticated?

    def show
    end

    def create
        game = Game.find(params[:id])

        begin
            Current.cart.games.find(game.id)
        rescue ActiveRecord::RecordNotFound => e
            Current.cart.games << game
            redirect_to current_cart_path
        else
            redirect_to game_path(game)
        end
    end

    def update
        game = Game.find(params[:id])

        begin
            Current.cart.games.find(game.id)
        rescue ActiveRecord::RecordNotFound => e
        else
            Current.cart.games.delete(game)
        end
        redirect_to current_cart_path
    end

end