class GamesController < ApplicationController

    def index
        @games = Game.order(:title)
    end

    def show
        @game = Game.find(params[:id])
        @added = Current.user.present? && Current.cart.present? && Current.cart.games.exists?(@game.id)
    end

end