class GamesController < ApplicationController

    def index
        @games = Game.order(:title)
    end

    def show
        @game = Game.find(params[:id])
        @added = false
        if Current.user.present? && Current.cart.present?
            begin
                Current.cart.games.find(@game.id)
            rescue ActiveRecord::RecordNotFound => e
            else
                @added = true
            end
        end
    end

end