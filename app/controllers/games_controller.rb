class GamesController < ApplicationController

    def index
        @games = Game.order(:title)
    end

    def show
        @game = Game.find(params[:id])
        @added = current_user && current_cart.present? && current_cart.games.exists?(@game.id)
    end

end